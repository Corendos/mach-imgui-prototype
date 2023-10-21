const std = @import("std");
const imgui = @import("imgui.zig");
const core = @import("mach-core");
const gpu = core.gpu;

var allocator: std.mem.Allocator = undefined;

// dear imgui: Renderer for WebGPU
// This needs to be used along with a Platform Binding (e.g. GLFW)
// (Please note that WebGPU is currently experimental, will not run on non-beta browsers, and may break.)

// Implemented features:
//  [X] Renderer: User texture binding. Use 'WGPUTextureView' as imgui.TextureID. Read the FAQ about imgui.TextureID!
//  [X] Renderer: Large meshes support (64k+ vertices) with 16-bit indices.

// You can use unmodified imgui_impl_* files in your project. See examples/ folder for examples of using this.
// Prefer including the entire imgui/ repository into your project (either as a copy or as a submodule), and only build the backends you need.
// Learn about Dear ImGui:
// - FAQ                  https://dearimgui.com/faq
// - Getting Started      https://dearimgui.com/getting-started
// - Documentation        https://dearimgui.com/docs (same as your local docs/ folder).
// - Introduction, links and more at the top of imgui.cpp

// CHANGELOG
// (minor and older changes stripped away, please see git history for details)
//  2023-07-13: Use WGPUShaderModuleWGSLDescriptor's code instead of source. use WGPUMipmapFilterMode_Linear instead of WGPUFilterMode_Linear. (#6602)
//  2023-04-11: Align buffer sizes. Use WGSL shaders instead of precompiled SPIR-V.
//  2023-04-11: Reorganized backend to pull data from a single structure to facilitate usage with multiple-contexts (all g_XXXX access changed to bd->XXXX).
//  2023-01-25: Revert automatic pipeline layout generation (see https://github.com/gpuweb/gpuweb/issues/2470)
//  2022-11-24: Fixed validation error with default depth buffer settings.
//  2022-11-10: Fixed rendering when a depth buffer is enabled. Added 'WGPUTextureFormat depth_format' parameter to ImGui_ImplWGPU_Init().
//  2022-10-11: Using 'nullptr' instead of 'NULL' as per our switch to C++11.
//  2021-11-29: Passing explicit buffer sizes to wgpuRenderPassEncoderSetVertexBuffer()/wgpuRenderPassEncoderSetIndexBuffer().
//  2021-08-24: Fixed for latest specs.
//  2021-05-24: Add support for draw_data->FramebufferScale.
//  2021-05-19: Replaced direct access to imgui.DrawCmd::TextureId with a call to imgui.DrawCmd::GetTexID(). (will become a requirement)
//  2021-05-16: Update to latest WebGPU specs (compatible with Emscripten 2.0.20 and Chrome Canary 92).
//  2021-02-18: Change blending equation to preserve alpha in output buffer.
//  2021-01-28: Initial version.

// Dear ImGui prototypes from imgui_internal.h
//extern imgui.ID ImHashData(const void* data_p, size_t data_size, ImU32 seed = 0);
fn MEMALIGN(_SIZE: usize, _ALIGN: usize) usize {
    return (((_SIZE) + ((_ALIGN) - 1)) & ~((_ALIGN) - 1));
} // Memory align (copied from IM_ALIGN() macro).

// WebGPU data
const RenderResources = struct {
    FontTexture: ?*gpu.Texture = null, // Font texture
    FontTextureView: ?*gpu.TextureView = null, // Texture view for font texture
    Sampler: ?*gpu.Sampler = null, // Sampler for the font texture
    Uniforms: ?*gpu.Buffer = null, // Shader uniforms
    CommonBindGroup: ?*gpu.BindGroup = null, // Resources bind-group to bind the common resources to pipeline
    ImageBindGroups: std.AutoHashMapUnmanaged(imgui.TextureID, *gpu.BindGroup), // Resources bind-group to bind the font/image resources to pipeline
    ImageBindGroup: ?*gpu.BindGroup = null, // Default font-resource of Dear ImGui
    ImageBindGroupLayout: ?*gpu.BindGroupLayout = null, // Cache layout used for the image bind group. Avoids allocating unnecessary JS objects when working with WebASM

    pub fn release(self: *RenderResources) void {
        if (self.FontTexture) |x| x.release();
        if (self.FontTextureView) |x| x.release();
        if (self.Sampler) |x| x.release();
        if (self.Uniforms) |x| x.release();
        if (self.CommonBindGroup) |x| x.release();
        if (self.ImageBindGroup) |x| x.release();
        if (self.ImageBindGroupLayout) |x| x.release();

        self.FontTexture = null;
        self.FontTextureView = null;
        self.Sampler = null;
        self.Uniforms = null;
        self.CommonBindGroup = null;
        self.ImageBindGroup = null;
        self.ImageBindGroupLayout = null;
    }
};

const FrameResources = struct {
    IndexBuffer: ?*gpu.Buffer,
    VertexBuffer: ?*gpu.Buffer,
    IndexBufferHost: ?[]imgui.DrawIdx,
    VertexBufferHost: ?[]imgui.DrawVert,
    IndexBufferSize: usize,
    VertexBufferSize: usize,

    pub fn release(self: *FrameResources) void {
        if (self.IndexBuffer) |x| x.release();
        if (self.VertexBuffer) |x| x.release();
        if (self.IndexBufferHost) |x| allocator.free(x);
        if (self.VertexBufferHost) |x| allocator.free(x);

        self.IndexBuffer = null;
        self.VertexBuffer = null;
        self.IndexBufferHost = null;
        self.VertexBufferHost = null;
    }
};

const Uniforms = struct {
    MVP: [4][4]f32,
    Gamma: f32,
};

const ImGui_ImplWGPU_Data = struct {
    wgpuDevice: ?*gpu.Device = null,
    defaultQueue: ?*gpu.Queue = null,
    renderTargetFormat: gpu.Texture.Format = .undefined,
    depthStencilFormat: gpu.Texture.Format = .undefined,
    pipelineState: ?*gpu.RenderPipeline = null,

    renderResources: RenderResources,
    pFrameResources: []FrameResources = &[_]FrameResources{},
    numFramesInFlight: u32 = 0,
    frameIndex: u32 = std.math.maxInt(u32),
};

// Backend data stored in io.BackendRendererUserData to allow support for multiple Dear ImGui contexts
// It is STRONGLY preferred that you use docking branch with multi-viewports (== single Dear ImGui context + multiple windows) instead of multiple Dear ImGui contexts.
fn ImGui_ImplWGPU_GetBackendData() ?*ImGui_ImplWGPU_Data {
    return if (imgui.GetCurrentContext()) |_| @ptrCast(@alignCast(imgui.GetIO().BackendRendererUserData)) else null;
}

//-----------------------------------------------------------------------------
// SHADERS
//-----------------------------------------------------------------------------

fn ImGui_ImplWGPU_CreateShaderModule(wgsl_source: [*:0]const u8) gpu.ProgrammableStageDescriptor {
    const bd = ImGui_ImplWGPU_GetBackendData().?;

    const desc: gpu.ShaderModule.Descriptor = .{
        .next_in_chain = .{ .wgsl_descriptor = &.{
            .code = wgsl_source,
        } },
    };

    const module = bd.wgpuDevice.?.createShaderModule(&desc);

    return .{ .module = module, .entry_point = "main" };
}

fn ImGui_ImplWGPU_CreateImageBindGroup(layout: *gpu.BindGroupLayout, texture: *gpu.TextureView) *gpu.BindGroup {
    const bd = ImGui_ImplWGPU_GetBackendData().?;

    const image_bg_entries = [_]gpu.BindGroup.Entry{.{ .binding = 0, .texture_view = texture, .size = 0 }};

    const image_bg_descriptor: gpu.BindGroup.Descriptor = .{
        .layout = layout,
        .entry_count = image_bg_entries.len,
        .entries = &image_bg_entries,
    };
    return bd.wgpuDevice.?.createBindGroup(&image_bg_descriptor);
}

fn ImGui_ImplWGPU_SetupRenderState(draw_data: *imgui.DrawData, ctx: *gpu.RenderPassEncoder, fr: *FrameResources) void {
    const bd = ImGui_ImplWGPU_GetBackendData().?;

    // Setup orthographic projection matrix into our constant buffer
    // Our visible imgui space lies from draw_data->DisplayPos (top left) to draw_data->DisplayPos+data_data->DisplaySize (bottom right).
    {
        const L = draw_data.DisplayPos.x;
        const R = draw_data.DisplayPos.x + draw_data.DisplaySize.x;
        const T = draw_data.DisplayPos.y;
        const B = draw_data.DisplayPos.y + draw_data.DisplaySize.y;

        var uniforms: Uniforms = undefined;
        uniforms.MVP = [4][4]f32{
            [4]f32{ 2.0 / (R - L), 0.0, 0.0, 0.0 },
            [4]f32{ 0.0, 2.0 / (T - B), 0.0, 0.0 },
            [4]f32{ 0.0, 0.0, 0.5, 0.0 },
            [4]f32{ (R + L) / (L - R), (T + B) / (B - T), 0.5, 1.0 },
        };
        uniforms.Gamma = switch (bd.renderTargetFormat) {
            .astc10x10_unorm_srgb,
            .astc10x5_unorm_srgb,
            .astc10x6_unorm_srgb,
            .astc10x8_unorm_srgb,
            .astc12x10_unorm_srgb,
            .astc12x12_unorm_srgb,
            .astc4x4_unorm_srgb,
            .astc5x5_unorm_srgb,
            .astc6x5_unorm_srgb,
            .astc6x6_unorm_srgb,
            .astc8x5_unorm_srgb,
            .astc8x6_unorm_srgb,
            .astc8x8_unorm_srgb,
            .bc1_rgba_unorm_srgb,
            .bc2_rgba_unorm_srgb,
            .bc3_rgba_unorm_srgb,
            .bc7_rgba_unorm_srgb,
            .bgra8_unorm_srgb,
            .etc2_rgb8_a1_unorm_srgb,
            .etc2_rgb8_unorm_srgb,
            .etc2_rgba8_unorm_srgb,
            .rgba8_unorm_srgb,
            => 2.2,
            else => 1.0,
        };

        bd.defaultQueue.?.writeBuffer(bd.renderResources.Uniforms.?, 0, &[_]Uniforms{uniforms});
    }

    // Setup viewport
    ctx.setViewport(0, 0, draw_data.FramebufferScale.x * draw_data.DisplaySize.x, draw_data.FramebufferScale.y * draw_data.DisplaySize.y, 0, 1);

    // Bind shader and vertex buffers
    ctx.setVertexBuffer(0, fr.VertexBuffer.?, 0, fr.VertexBufferSize * @sizeOf(imgui.DrawVert));
    ctx.setIndexBuffer(fr.IndexBuffer.?, if (@sizeOf(imgui.DrawIdx) == 2) .uint16 else .uint32, 0, fr.IndexBufferSize * @sizeOf(imgui.DrawIdx));
    ctx.setPipeline(bd.pipelineState.?);
    ctx.setBindGroup(0, bd.renderResources.CommonBindGroup.?, &.{});
}

// Render function
// (this used to be set in io.RenderDrawListsFn and called by imgui.Render(), but you can now call this directly from your main loop)
pub fn renderDrawData(draw_data: *imgui.DrawData, pass_encoder: *gpu.RenderPassEncoder) void {
    // Avoid rendering when minimized
    if (draw_data.DisplaySize.x <= 0.0 or draw_data.DisplaySize.y <= 0.0)
        return;

    // FIXME: Assuming that this only gets called once per frame!
    // If not, we can't just re-allocate the IB or VB, we'll have to do a proper allocator.
    var bd = ImGui_ImplWGPU_GetBackendData().?;
    bd.frameIndex = @addWithOverflow(bd.frameIndex, 1)[0];
    var fr = &bd.pFrameResources[bd.frameIndex % bd.numFramesInFlight];

    // Create and grow vertex/index buffers if needed
    if (fr.VertexBuffer == null or fr.VertexBufferSize < draw_data.TotalVtxCount) {
        if (fr.VertexBuffer != null) {
            fr.VertexBuffer.?.destroy();
            fr.VertexBuffer.?.release();
        }
        if (fr.VertexBufferHost) |x| allocator.free(x);
        fr.VertexBufferSize = @intCast(draw_data.TotalVtxCount + 5000);

        const vb_desc = gpu.Buffer.Descriptor{
            .label = "Dear ImGui Vertex buffer",
            .usage = .{ .copy_dst = true, .vertex = true },
            .size = MEMALIGN(fr.VertexBufferSize * @sizeOf(imgui.DrawVert), 4),
        };
        fr.VertexBuffer = bd.wgpuDevice.?.createBuffer(&vb_desc);
        fr.VertexBufferHost = allocator.alloc(imgui.DrawVert, fr.VertexBufferSize) catch @panic("OutOfMemory");
    }
    if (fr.IndexBuffer == null or fr.IndexBufferSize < draw_data.TotalIdxCount) {
        if (fr.IndexBuffer != null) {
            fr.IndexBuffer.?.destroy();
            fr.IndexBuffer.?.release();
        }
        if (fr.IndexBufferHost) |x| allocator.free(x);
        fr.IndexBufferSize = @intCast(draw_data.TotalIdxCount + 10000);

        const ib_desc = gpu.Buffer.Descriptor{
            .label = "Dear ImGui Index buffer",
            .usage = .{ .copy_dst = true, .index = true },
            .size = MEMALIGN(fr.IndexBufferSize * @sizeOf(imgui.DrawIdx), 4),
        };
        fr.IndexBuffer = bd.wgpuDevice.?.createBuffer(&ib_desc);
        fr.IndexBufferHost = allocator.alloc(imgui.DrawIdx, fr.IndexBufferSize) catch @panic("OutOfMemory");
    }

    // Upload vertex/index data into a single contiguous GPU buffer
    var vtx_dst: []imgui.DrawVert = fr.VertexBufferHost.?;
    var idx_dst: []imgui.DrawIdx = fr.IndexBufferHost.?;
    var vb_write_size: usize = 0;
    var ib_write_size: usize = 0;
    for (0..@intCast(draw_data.CmdListsCount)) |n| {
        const cmd_list: *imgui.DrawList = draw_data.CmdLists.Data[n];
        const vtx_size: usize = @intCast(cmd_list.VtxBuffer.Size);
        const idx_size: usize = @intCast(cmd_list.IdxBuffer.Size);
        @memcpy(vtx_dst[0..vtx_size], cmd_list.VtxBuffer.Data[0..vtx_size]);
        @memcpy(idx_dst[0..idx_size], cmd_list.IdxBuffer.Data[0..idx_size]);
        vtx_dst = vtx_dst[vtx_size..];
        idx_dst = idx_dst[idx_size..];
        vb_write_size += vtx_size;
        ib_write_size += idx_size;
    }
    vb_write_size = MEMALIGN(vb_write_size, 4);
    ib_write_size = MEMALIGN(ib_write_size, 4);
    if (vb_write_size > 0)
        bd.defaultQueue.?.writeBuffer(fr.VertexBuffer.?, 0, fr.VertexBufferHost.?[0..vb_write_size]);
    if (ib_write_size > 0)
        bd.defaultQueue.?.writeBuffer(fr.IndexBuffer.?, 0, fr.IndexBufferHost.?[0..ib_write_size]);

    // Setup desired render state
    ImGui_ImplWGPU_SetupRenderState(draw_data, pass_encoder, fr);

    // Render command lists
    // (Because we merged all buffers into a single one, we maintain our own offset into them)
    var global_vtx_offset: c_uint = 0;
    var global_idx_offset: c_uint = 0;
    var clip_scale: imgui.Vec2 = draw_data.FramebufferScale;
    var clip_off: imgui.Vec2 = draw_data.DisplayPos;
    for (0..@intCast(draw_data.CmdListsCount)) |n| {
        const cmd_list: *imgui.DrawList = draw_data.CmdLists.Data[n];
        for (0..@intCast(cmd_list.CmdBuffer.Size)) |cmd_i| {
            const pcmd: *imgui.DrawCmd = &cmd_list.CmdBuffer.Data[cmd_i];
            if (pcmd.UserCallback != null) {
                // User callback, registered via imgui.DrawList_AddCallback()
                // (ImDrawCallback_ResetRenderState is a special callback value used by the user to request the renderer to reset render state.)
                // if (pcmd.UserCallback == imgui.DrawCallback_ResetRenderState) {
                //     ImGui_ImplWGPU_SetupRenderState(draw_data, pass_encoder, fr);
                // } else {
                //     pcmd.UserCallback(cmd_list, pcmd);
                // }
                pcmd.UserCallback.?(cmd_list, pcmd);
            } else {
                // Bind custom texture
                const tex_id: imgui.TextureID = imgui.DrawCmd_GetTexID(pcmd);
                const opt_bind_group = bd.renderResources.ImageBindGroups.get(tex_id);
                if (opt_bind_group) |bind_group| {
                    pass_encoder.setBindGroup(1, bind_group, &.{});
                } else {
                    const image_bind_group: *gpu.BindGroup = ImGui_ImplWGPU_CreateImageBindGroup(
                        bd.renderResources.ImageBindGroupLayout.?,
                        @ptrCast(tex_id),
                    );
                    bd.renderResources.ImageBindGroups.put(allocator, tex_id, image_bind_group) catch @panic("OutOfMemory");
                    pass_encoder.setBindGroup(1, image_bind_group, &.{});
                }

                // Project scissor/clipping rectangles into framebuffer space
                const clip_min: imgui.Vec2 = .{ .x = (pcmd.ClipRect.x - clip_off.x) * clip_scale.x, .y = (pcmd.ClipRect.y - clip_off.y) * clip_scale.y };
                const clip_max: imgui.Vec2 = .{ .x = (pcmd.ClipRect.z - clip_off.x) * clip_scale.x, .y = (pcmd.ClipRect.w - clip_off.y) * clip_scale.y };
                if (clip_max.x <= clip_min.x or clip_max.y <= clip_min.y)
                    continue;

                // Apply scissor/clipping rectangle, Draw
                pass_encoder.setScissorRect(
                    @intFromFloat(clip_min.x),
                    @intFromFloat(clip_min.y),
                    @intFromFloat(clip_max.x - clip_min.x),
                    @intFromFloat(clip_max.y - clip_min.y),
                );
                pass_encoder.drawIndexed(
                    pcmd.ElemCount,
                    1,
                    @intCast(pcmd.IdxOffset + global_idx_offset),
                    @intCast(pcmd.VtxOffset + global_vtx_offset),
                    0,
                );
            }
        }
        global_idx_offset += @intCast(cmd_list.IdxBuffer.Size);
        global_vtx_offset += @intCast(cmd_list.VtxBuffer.Size);
    }
}

pub fn ImGui_ImplWGPU_CreateFontsTexture() void {
    // Build texture atlas
    const bd = ImGui_ImplWGPU_GetBackendData().?;

    const io = imgui.GetIO();
    var pixels: ?*c_char = undefined;
    var width: c_int = undefined;
    var height: c_int = undefined;
    var size_pp: c_int = undefined;
    imgui.FontAtlas_GetTexDataAsRGBA32(io.Fonts.?, &pixels, &width, &height, &size_pp);
    var pixels_data: ?[*]c_char = @ptrCast(pixels);

    // Upload texture to graphics system
    {
        const tex_desc: gpu.Texture.Descriptor = .{
            .label = "Dear ImGui Font Texture",
            .dimension = .dimension_2d,
            .size = .{
                .width = @intCast(width),
                .height = @intCast(height),
                .depth_or_array_layers = 1,
            },
            .sample_count = 1,
            .format = .rgba8_unorm,
            .mip_level_count = 1,
            .usage = .{ .copy_dst = true, .texture_binding = true },
        };
        bd.renderResources.FontTexture = bd.wgpuDevice.?.createTexture(&tex_desc);

        const tex_view_desc: gpu.TextureView.Descriptor = .{
            .format = .rgba8_unorm,
            .dimension = .dimension_2d,
            .base_mip_level = 0,
            .mip_level_count = 1,
            .base_array_layer = 0,
            .array_layer_count = 1,
            .aspect = .all,
        };
        bd.renderResources.FontTextureView = bd.renderResources.FontTexture.?.createView(&tex_view_desc);
    }

    // Upload texture data
    {
        var dst_view: gpu.ImageCopyTexture = .{
            .texture = bd.renderResources.FontTexture.?,
            .mip_level = 0,
            .origin = .{ .x = 0, .y = 0, .z = 0 },
            .aspect = .all,
        };
        var layout: gpu.Texture.DataLayout = .{
            .offset = 0,
            .bytes_per_row = @intCast(width * size_pp),
            .rows_per_image = @intCast(height),
        };
        const size: gpu.Extent3D = .{ .width = @intCast(width), .height = @intCast(height), .depth_or_array_layers = 1 };
        bd.defaultQueue.?.writeTexture(&dst_view, &layout, &size, pixels_data.?[0..@intCast(width * size_pp * height)]);
    }

    // Create the associated sampler
    // (Bilinear sampling is required by default. Set 'io.Fonts->Flags |= ImFontAtlasFlags_NoBakedLines' or 'style.AntiAliasedLinesUseTex = false' to allow point/nearest sampling)
    {
        var sampler_desc: gpu.Sampler.Descriptor = .{
            .min_filter = .linear,
            .mag_filter = .linear,
            .mipmap_filter = .linear,
            .address_mode_u = .repeat,
            .address_mode_v = .repeat,
            .address_mode_w = .repeat,
            .max_anisotropy = 1,
        };
        bd.renderResources.Sampler = bd.wgpuDevice.?.createSampler(&sampler_desc);
    }

    // Store our identifier
    imgui.FontAtlas_SetTexID(io.Fonts.?, bd.renderResources.FontTextureView);
}

fn ImGui_ImplWGPU_CreateUniformBuffer() void {
    const bd = ImGui_ImplWGPU_GetBackendData().?;

    const ub_desc = gpu.Buffer.Descriptor{
        .label = "Dear ImGui Uniform buffer",
        .usage = .{ .copy_dst = true, .uniform = true },
        .size = MEMALIGN(@sizeOf(Uniforms), 16),
    };
    bd.renderResources.Uniforms = bd.wgpuDevice.?.createBuffer(&ub_desc);
}

fn ImGui_ImplWGPU_CreateDeviceObjects() bool {
    const bd = ImGui_ImplWGPU_GetBackendData().?;
    if (bd.wgpuDevice == null)
        return false;
    if (bd.pipelineState != null)
        ImGui_ImplWGPU_InvalidateDeviceObjects();

    // Bind group layouts
    var common_bg_layout_entries = [2]gpu.BindGroupLayout.Entry{
        .{
            .binding = 0,
            .visibility = .{ .vertex = true, .fragment = true },
            .buffer = .{ .type = .uniform },
        },
        .{
            .binding = 1,
            .visibility = .{ .fragment = true },
            .sampler = .{ .type = .filtering },
        },
    };

    var image_bg_layout_entries = [1]gpu.BindGroupLayout.Entry{
        .{
            .binding = 0,
            .visibility = .{ .fragment = true },
            .texture = .{
                .sample_type = .float,
                .view_dimension = .dimension_2d,
            },
        },
    };

    var common_bg_layout_desc: gpu.BindGroupLayout.Descriptor = .{
        .entry_count = 2,
        .entries = &common_bg_layout_entries,
    };

    var image_bg_layout_desc: gpu.BindGroupLayout.Descriptor = .{
        .entry_count = 1,
        .entries = &image_bg_layout_entries,
    };

    var bg_layouts: [2]*gpu.BindGroupLayout = undefined;
    bg_layouts[0] = bd.wgpuDevice.?.createBindGroupLayout(&common_bg_layout_desc);
    bg_layouts[1] = bd.wgpuDevice.?.createBindGroupLayout(&image_bg_layout_desc);

    // Pipeline layout
    const layout_desc: gpu.PipelineLayout.Descriptor = .{
        .bind_group_layout_count = 2,
        .bind_group_layouts = &bg_layouts,
    };

    const layout = bd.wgpuDevice.?.createPipelineLayout(&layout_desc);

    // Shaders
    const vertex_shader_desc = ImGui_ImplWGPU_CreateShaderModule(@embedFile("vert.wgsl"));
    const pixel_shader_desc = ImGui_ImplWGPU_CreateShaderModule(@embedFile("frag.wgsl"));

    // Vertex Buffers
    const attribute_desc = [_]gpu.VertexAttribute{
        .{ .format = .float32x2, .offset = @offsetOf(imgui.DrawVert, "pos"), .shader_location = 0 },
        .{ .format = .float32x2, .offset = @offsetOf(imgui.DrawVert, "uv"), .shader_location = 1 },
        .{ .format = .unorm8x4, .offset = @offsetOf(imgui.DrawVert, "col"), .shader_location = 2 },
    };

    const buffer_layouts = [_]gpu.VertexBufferLayout{.{
        .array_stride = @sizeOf(imgui.DrawVert),
        .step_mode = .vertex,
        .attribute_count = 3,
        .attributes = &attribute_desc,
    }};

    // Color targets
    const color_targets = [_]gpu.ColorTargetState{.{
        .format = bd.renderTargetFormat,
        .blend = &.{ .alpha = .{
            .operation = .add,
            .src_factor = .one,
            .dst_factor = .one_minus_src_alpha,
        }, .color = .{
            .operation = .add,
            .src_factor = .src_alpha,
            .dst_factor = .one_minus_src_alpha,
        } },
        .write_mask = gpu.ColorWriteMaskFlags.all,
    }};

    // Create render pipeline
    const graphics_pipeline_desc: gpu.RenderPipeline.Descriptor = .{
        .layout = layout,
        .vertex = .{
            .module = vertex_shader_desc.module,
            .entry_point = vertex_shader_desc.entry_point,
            .buffer_count = buffer_layouts.len,
            .buffers = &buffer_layouts,
        },
        .primitive = .{
            .topology = .triangle_list,
            .strip_index_format = .undefined,
            .front_face = .cw,
            .cull_mode = .none,
        },
        .depth_stencil = if (bd.depthStencilFormat == .undefined) null else &.{
            .format = bd.depthStencilFormat,
            .depth_write_enabled = .false,
            .depth_compare = .always,
            .stencil_front = .{ .compare = .always },
            .stencil_back = .{ .compare = .always },
        },
        .multisample = .{
            .count = 1,
            .mask = std.math.maxInt(u32),
            .alpha_to_coverage_enabled = .false,
        },
        .fragment = &.{
            .module = pixel_shader_desc.module,
            .entry_point = pixel_shader_desc.entry_point,
            .target_count = color_targets.len,
            .targets = &color_targets,
        },
    };

    bd.pipelineState = bd.wgpuDevice.?.createRenderPipeline(&graphics_pipeline_desc);

    ImGui_ImplWGPU_CreateFontsTexture();
    ImGui_ImplWGPU_CreateUniformBuffer();

    // Create resource bind group
    const common_bg_entries = [_]gpu.BindGroup.Entry{
        .{ .binding = 0, .buffer = bd.renderResources.Uniforms, .offset = 0, .size = MEMALIGN(@sizeOf(Uniforms), 16) },
        .{ .binding = 1, .sampler = bd.renderResources.Sampler, .size = 0 },
    };

    const common_bg_descriptor: gpu.BindGroup.Descriptor = .{
        .layout = bg_layouts[0],
        .entry_count = common_bg_entries.len,
        .entries = &common_bg_entries,
    };
    bd.renderResources.CommonBindGroup = bd.wgpuDevice.?.createBindGroup(&common_bg_descriptor);

    const image_bind_group = ImGui_ImplWGPU_CreateImageBindGroup(bg_layouts[1], bd.renderResources.FontTextureView.?);
    bd.renderResources.ImageBindGroup = image_bind_group;
    bd.renderResources.ImageBindGroupLayout = bg_layouts[1];
    bd.renderResources.ImageBindGroups.put(allocator, bd.renderResources.FontTextureView, image_bind_group) catch @panic("OutOfMemory");

    vertex_shader_desc.module.release();
    pixel_shader_desc.module.release();
    bg_layouts[0].release();

    return true;
}

fn ImGui_ImplWGPU_InvalidateDeviceObjects() void {
    const bd = ImGui_ImplWGPU_GetBackendData().?;

    if (bd.wgpuDevice == null)
        return;

    if (bd.pipelineState) |x| x.release();
    bd.pipelineState = null;

    bd.renderResources.release();

    var io = imgui.GetIO();
    imgui.FontAtlas_SetTexID(io.Fonts.?, null); // We copied g_pFontTextureView to io.Fonts->TexID so let's clear that as well.

    for (bd.pFrameResources) |*frame_resources| frame_resources.release();
}

pub fn init(
    allocator_: std.mem.Allocator,
    device: *gpu.Device,
    num_frames_in_flight: u32,
    rt_format: gpu.Texture.Format,
    depth_format: gpu.Texture.Format,
) bool {
    allocator = allocator_;

    var io = imgui.GetIO();
    std.debug.assert(io.BackendRendererUserData == null);

    // Setup backend capabilities flags
    var bd = allocator.create(ImGui_ImplWGPU_Data) catch @panic("OutOfMemory");

    io.BackendRendererUserData = bd;
    io.BackendRendererName = "imgui_impl_webgpu";
    io.BackendFlags = @enumFromInt(@intFromEnum(io.BackendFlags) | @intFromEnum(imgui.BackendFlags.RendererHasVtxOffset)); // We can honor the imgui.DrawCmd::VtxOffset field, allowing for large meshes.

    bd.wgpuDevice = device;
    bd.defaultQueue = bd.wgpuDevice.?.getQueue();
    bd.renderTargetFormat = rt_format;
    bd.depthStencilFormat = depth_format;
    bd.pipelineState = null;
    bd.numFramesInFlight = num_frames_in_flight;
    bd.frameIndex = std.math.maxInt(u32);

    bd.renderResources.FontTexture = null;
    bd.renderResources.FontTextureView = null;
    bd.renderResources.Sampler = null;
    bd.renderResources.Uniforms = null;
    bd.renderResources.CommonBindGroup = null;
    bd.renderResources.ImageBindGroups = .{};
    bd.renderResources.ImageBindGroup = null;
    bd.renderResources.ImageBindGroupLayout = null;

    // Create buffers with a default size (they will later be grown as needed)
    bd.pFrameResources = allocator.alloc(FrameResources, num_frames_in_flight) catch @panic("OutOfMemory");
    for (0..num_frames_in_flight) |i| {
        var fr: *FrameResources = &bd.pFrameResources[i];
        fr.IndexBuffer = null;
        fr.VertexBuffer = null;
        fr.IndexBufferHost = null;
        fr.VertexBufferHost = null;
        fr.IndexBufferSize = 10000;
        fr.VertexBufferSize = 5000;
    }

    return true;
}

pub fn shutdown() void {
    var bd = ImGui_ImplWGPU_GetBackendData().?;
    var io = imgui.GetIO();

    ImGui_ImplWGPU_InvalidateDeviceObjects();
    allocator.free(bd.pFrameResources);
    bd.pFrameResources = null;
    bd.defaultQueue.release();
    bd.wgpuDevice = null;
    bd.numFramesInFlight = 0;
    bd.frameIndex = std.math.maxInt(u32);

    io.BackendRendererName = null;
    io.BackendRendererUserData = null;
    io.BackendFlags = @enumFromInt(@intFromEnum(io.BackendFlags) & ~@intFromEnum(imgui.BackendFlags.RendererHasVtxOffset));
    allocator.free(bd);
}

pub fn newFrame() void {
    const bd = ImGui_ImplWGPU_GetBackendData().?;

    if (bd.pipelineState == null)
        _ = ImGui_ImplWGPU_CreateDeviceObjects();
}
