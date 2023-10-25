const std = @import("std");
const imgui = @import("imgui.zig");
const core = @import("mach-core");
const gpu = core.gpu;

var allocator: std.mem.Allocator = undefined;

// ------------------------------------------------------------------------------------------------
// Public API
// ------------------------------------------------------------------------------------------------

pub fn init(
    allocator_: std.mem.Allocator,
    device: *gpu.Device,
    max_frames_in_flight: u32,
    color_format: gpu.Texture.Format,
    depth_stencil_format: gpu.Texture.Format,
) !void {
    allocator = allocator_;

    var io = imgui.GetIO();
    std.debug.assert(io.BackendPlatformUserData == null);
    std.debug.assert(io.BackendRendererUserData == null);

    var brp = try allocator.create(BackendPlatformData);
    brp.* = BackendPlatformData.init();
    io.BackendPlatformUserData = brp;

    var brd = try allocator.create(BackendRendererData);
    brd.* = BackendRendererData.init(device, max_frames_in_flight, color_format, depth_stencil_format);
    io.BackendRendererUserData = brd;
}

pub fn shutdown() void {
    var bpd = BackendPlatformData.get();
    bpd.deinit();
    allocator.destroy(bpd);

    var brd = BackendRendererData.get();
    brd.deinit();
    allocator.destroy(brd);
}

pub fn newFrame() !void {
    try BackendPlatformData.get().newFrame();
    try BackendRendererData.get().newFrame();
}

pub fn processEvent(event: core.Event) bool {
    return BackendPlatformData.get().processEvent(event);
}

pub fn renderDrawData(draw_data: *imgui.DrawData, pass_encoder: *gpu.RenderPassEncoder) !void {
    try BackendRendererData.get().render(draw_data, pass_encoder);
}

// ------------------------------------------------------------------------------------------------
// Platform
// ------------------------------------------------------------------------------------------------

// Missing from mach:
// - HasSetMousePos
// - Clipboard
// - IME
// - Mouse Source (e.g. pen, touch)
// - Mouse Enter/Leave
// - joystick/gamepad

// Bugs?
// - Positive Delta Time

const BackendPlatformData = struct {
    pub fn init() BackendPlatformData {
        var io = imgui.GetIO();
        io.BackendPlatformName = "imgui_mach";
        // TODO - flags or ints
        //io.BackendFlags = @enumFromInt(@intFromEnum(io.BackendFlags) | @intFromEnum(imgui.BackendFlags.HasMouseCursors));
        //io.BackendFlags = @enumFromInt(@intFromEnum(io.BackendFlags) | @intFromEnum(imgui.BackendFlags.HasSetMousePos));

        return .{};
    }

    pub fn deinit(bd: *BackendPlatformData) void {
        _ = bd;
        var io = imgui.GetIO();
        io.BackendPlatformName = null;
    }

    pub fn get() *BackendPlatformData {
        std.debug.assert(imgui.GetCurrentContext() != null);

        const io = imgui.GetIO();
        return @ptrCast(@alignCast(io.BackendPlatformUserData));
    }

    pub fn newFrame(bd: *BackendPlatformData) !void {
        _ = bd;
        var io = imgui.GetIO();

        // DisplaySize
        const window_size = core.size();
        const w: f32 = @floatFromInt(window_size.width);
        const h: f32 = @floatFromInt(window_size.height);
        const display_w: f32 = @floatFromInt(core.descriptor.width);
        const display_h: f32 = @floatFromInt(core.descriptor.height);

        io.DisplaySize = imgui.Vec2{ .x = w, .y = h };

        // DisplayFramebufferScale
        if (w > 0 and h > 0)
            io.DisplayFramebufferScale = imgui.Vec2{ .x = display_w / w, .y = display_h / h };

        // DeltaTime
        io.DeltaTime = if (core.delta_time > 0.0) core.delta_time else 1.0e-6;

        // WantSetMousePos - TODO

        // MouseCursor
        if ((@intFromEnum(io.ConfigFlags) & @intFromEnum(imgui.ConfigFlags.NoMouseCursorChange)) == 0) {
            const imgui_cursor = imgui.GetMouseCursor();

            if (io.MouseDrawCursor or imgui_cursor == imgui.MouseCursor.None) {
                core.setCursorMode(.hidden);
            } else {
                core.setCursorMode(.normal);
                core.setCursorShape(machCursorShape(imgui_cursor));
            }
        }

        // Gamepads - TODO
    }

    pub fn processEvent(bd: *BackendPlatformData, event: core.Event) bool {
        _ = bd;
        var io = imgui.GetIO();
        switch (event) {
            .key_press, .key_repeat => |data| {
                addKeyMods(data.mods);
                const key = imguiKey(data.key);
                imgui.IO_AddKeyEvent(io, key, true);
                return true;
            },
            .key_release => |data| {
                addKeyMods(data.mods);
                const key = imguiKey(data.key);
                imgui.IO_AddKeyEvent(io, key, false);
                return true;
            },
            .char_input => |data| {
                imgui.IO_AddInputCharacter(io, data.codepoint);
                return true;
            },
            .mouse_motion => |data| {
                // TODO - imgui.IO_AddMouseSourceEvent
                imgui.IO_AddMousePosEvent(io, @floatCast(data.pos.x), @floatCast(data.pos.y));
                return true;
            },
            .mouse_press => |data| {
                const mouse_button = imguiMouseButton(data.button);
                // TODO - imgui.IO_AddMouseSourceEvent
                imgui.IO_AddMouseButtonEvent(io, mouse_button, true);
                return true;
            },
            .mouse_release => |data| {
                const mouse_button = imguiMouseButton(data.button);
                // TODO - imgui.IO_AddMouseSourceEvent
                imgui.IO_AddMouseButtonEvent(io, mouse_button, false);
                return true;
            },
            .mouse_scroll => |data| {
                // TODO - imgui.IO_AddMouseSourceEvent
                imgui.IO_AddMouseWheelEvent(io, data.xoffset, data.yoffset);
                return true;
            },
            .joystick_connected => {},
            .joystick_disconnected => {},
            .framebuffer_resize => {},
            .focus_gained => {
                imgui.IO_AddFocusEvent(io, true);
                return true;
            },
            .focus_lost => {
                imgui.IO_AddFocusEvent(io, false);
                return true;
            },
            .close => {},

            // TODO - mouse enter/leave?
        }

        return false;
    }

    fn addKeyMods(mods: core.KeyMods) void {
        var io = imgui.GetIO();
        imgui.IO_AddKeyEvent(io, imgui.Key.ImGuiMod_Ctrl, mods.control);
        imgui.IO_AddKeyEvent(io, imgui.Key.ImGuiMod_Shift, mods.shift);
        imgui.IO_AddKeyEvent(io, imgui.Key.ImGuiMod_Alt, mods.alt);
        imgui.IO_AddKeyEvent(io, imgui.Key.ImGuiMod_Super, mods.super);
    }

    fn imguiMouseButton(button: core.MouseButton) i32 {
        return @intFromEnum(button);
    }

    fn imguiKey(key: core.Key) imgui.Key {
        return switch (key) {
            .a => ._A,
            .b => ._B,
            .c => ._C,
            .d => ._D,
            .e => ._E,
            .f => ._F,
            .g => ._G,
            .h => ._H,
            .i => ._I,
            .j => ._J,
            .k => ._K,
            .l => ._L,
            .m => ._M,
            .n => ._N,
            .o => ._O,
            .p => ._P,
            .q => ._Q,
            .r => ._R,
            .s => ._S,
            .t => ._T,
            .u => ._U,
            .v => ._V,
            .w => ._W,
            .x => ._X,
            .y => ._Y,
            .z => ._Z,

            .zero => ._0,
            .one => ._1,
            .two => ._2,
            .three => ._3,
            .four => ._4,
            .five => ._5,
            .six => ._6,
            .seven => ._7,
            .eight => ._8,
            .nine => ._9,

            .f1 => .F1,
            .f2 => .F2,
            .f3 => .F3,
            .f4 => .F4,
            .f5 => .F5,
            .f6 => .F6,
            .f7 => .F7,
            .f8 => .F8,
            .f9 => .F9,
            .f10 => .F10,
            .f11 => .F11,
            .f12 => .F12,
            .f13 => .F13,
            .f14 => .F14,
            .f15 => .F15,
            .f16 => .F16,
            .f17 => .F17,
            .f18 => .F18,
            .f19 => .F19,
            .f20 => .F20,
            .f21 => .F21,
            .f22 => .F22,
            .f23 => .F23,
            .f24 => .F24,
            .f25 => .None,

            .kp_divide => .KeypadDivide,
            .kp_multiply => .KeypadMultiply,
            .kp_subtract => .KeypadSubtract,
            .kp_add => .KeypadAdd,
            .kp_0 => .Keypad0,
            .kp_1 => .Keypad1,
            .kp_2 => .Keypad2,
            .kp_3 => .Keypad3,
            .kp_4 => .Keypad4,
            .kp_5 => .Keypad5,
            .kp_6 => .Keypad6,
            .kp_7 => .Keypad7,
            .kp_8 => .Keypad8,
            .kp_9 => .Keypad9,
            .kp_decimal => .KeypadDecimal,
            .kp_equal => .KeypadEqual,
            .kp_enter => .KeypadEnter,

            .enter => .Enter,
            .escape => .Escape,
            .tab => .Tab,
            .left_shift => .LeftShift,
            .right_shift => .RightShift,
            .left_control => .LeftCtrl,
            .right_control => .RightCtrl,
            .left_alt => .LeftAlt,
            .right_alt => .RightAlt,
            .left_super => .LeftSuper,
            .right_super => .RightSuper,
            .menu => .Menu,
            .num_lock => .NumLock,
            .caps_lock => .CapsLock,
            .print => .PrintScreen,
            .scroll_lock => .ScrollLock,
            .pause => .Pause,
            .delete => .Delete,
            .home => .Home,
            .end => .End,
            .page_up => .PageUp,
            .page_down => .PageDown,
            .insert => .Insert,
            .left => .LeftArrow,
            .right => .RightArrow,
            .up => .UpArrow,
            .down => .DownArrow,
            .backspace => .Backspace,
            .space => .Space,
            .minus => .Minus,
            .equal => .Equal,
            .left_bracket => .LeftBracket,
            .right_bracket => .RightBracket,
            .backslash => .Backslash,
            .semicolon => .Semicolon,
            .apostrophe => .Apostrophe,
            .comma => .Comma,
            .period => .Period,
            .slash => .Slash,
            .grave => .GraveAccent,

            .unknown => .None,
        };
    }

    fn machCursorShape(imgui_cursor: imgui.MouseCursor) core.CursorShape {
        return switch (imgui_cursor) {
            .None => unreachable,
            .Arrow => .arrow,
            .TextInput => .ibeam,
            .ResizeAll => .resize_all,
            .ResizeNS => .resize_ns,
            .ResizeEW => .resize_ew,
            .ResizeNESW => .resize_nesw,
            .ResizeNWSE => .resize_nwse,
            .Hand => .pointing_hand,
            .NotAllowed => .not_allowed,
            .COUNT => unreachable,
        };
    }
};

// ------------------------------------------------------------------------------------------------
// Renderer
// ------------------------------------------------------------------------------------------------

fn alignUp(x: usize, a: usize) usize {
    return (x + a - 1) & ~(a - 1);
}

const Uniforms = struct {
    MVP: [4][4]f32,
};

const BackendRendererData = struct {
    device: *gpu.Device,
    queue: *gpu.Queue,
    color_format: gpu.Texture.Format,
    depth_stencil_format: gpu.Texture.Format,
    device_resources: ?DeviceResources,
    max_frames_in_flight: u32,
    frame_index: u32,

    pub fn init(
        device: *gpu.Device,
        max_frames_in_flight: u32,
        color_format: gpu.Texture.Format,
        depth_stencil_format: gpu.Texture.Format,
    ) BackendRendererData {
        var io = imgui.GetIO();
        io.BackendRendererName = "imgui_mach";
        io.BackendFlags = @enumFromInt(@intFromEnum(io.BackendFlags) | @intFromEnum(imgui.BackendFlags.RendererHasVtxOffset));

        return .{
            .device = device,
            .queue = device.getQueue(),
            .color_format = color_format,
            .depth_stencil_format = depth_stencil_format,
            .device_resources = null,
            .max_frames_in_flight = max_frames_in_flight,
            .frame_index = std.math.maxInt(u32),
        };
    }

    pub fn deinit(bd: *BackendRendererData) void {
        var io = imgui.GetIO();
        io.BackendRendererName = null;
        io.BackendRendererUserData = null;

        if (bd.device_resources) |*device_resources| device_resources.deinit();
        bd.queue.release();
    }

    pub fn get() *BackendRendererData {
        std.debug.assert(imgui.GetCurrentContext() != null);

        const io = imgui.GetIO();
        return @ptrCast(@alignCast(io.BackendRendererUserData));
    }

    pub fn newFrame(bd: *BackendRendererData) !void {
        if (bd.device_resources == null)
            bd.device_resources = try DeviceResources.init(bd);
    }

    pub fn render(bd: *BackendRendererData, draw_data: *imgui.DrawData, pass_encoder: *gpu.RenderPassEncoder) !void {
        if (draw_data.DisplaySize.x <= 0.0 or draw_data.DisplaySize.y <= 0.0)
            return;

        // FIXME: Assuming that this only gets called once per frame!
        // If not, we can't just re-allocate the IB or VB, we'll have to do a proper allocator.
        if (bd.device_resources) |*device_resources| {
            bd.frame_index = @addWithOverflow(bd.frame_index, 1)[0];
            var fr = &device_resources.frame_resources[bd.frame_index % bd.max_frames_in_flight];

            // Create and grow vertex/index buffers if needed
            if (fr.vertex_buffer == null or fr.vertex_buffer_size < draw_data.TotalVtxCount) {
                if (fr.vertex_buffer) |buffer| {
                    buffer.destroy();
                    buffer.release();
                }
                if (fr.vertices) |x| allocator.free(x);
                fr.vertex_buffer_size = @intCast(draw_data.TotalVtxCount + 5000);

                fr.vertex_buffer = bd.device.createBuffer(&.{
                    .label = "Dear ImGui Vertex buffer",
                    .usage = .{ .copy_dst = true, .vertex = true },
                    .size = alignUp(fr.vertex_buffer_size * @sizeOf(imgui.DrawVert), 4),
                });
                fr.vertices = try allocator.alloc(imgui.DrawVert, fr.vertex_buffer_size);
            }
            if (fr.index_buffer == null or fr.index_buffer_size < draw_data.TotalIdxCount) {
                if (fr.index_buffer) |buffer| {
                    buffer.destroy();
                    buffer.release();
                }
                if (fr.indices) |x| allocator.free(x);
                fr.index_buffer_size = @intCast(draw_data.TotalIdxCount + 10000);

                fr.index_buffer = bd.device.createBuffer(&.{
                    .label = "Dear ImGui Index buffer",
                    .usage = .{ .copy_dst = true, .index = true },
                    .size = alignUp(fr.index_buffer_size * @sizeOf(imgui.DrawIdx), 4),
                });
                fr.indices = try allocator.alloc(imgui.DrawIdx, fr.index_buffer_size);
            }

            // Upload vertex/index data into a single contiguous GPU buffer
            var vtx_dst = fr.vertices.?;
            var idx_dst = fr.indices.?;
            var vb_write_size: usize = 0;
            var ib_write_size: usize = 0;
            for (0..@intCast(draw_data.CmdListsCount)) |n| {
                const cmd_list = draw_data.CmdLists.Data[n];
                const vtx_size: usize = @intCast(cmd_list.VtxBuffer.Size);
                const idx_size: usize = @intCast(cmd_list.IdxBuffer.Size);
                @memcpy(vtx_dst[0..vtx_size], cmd_list.VtxBuffer.Data[0..vtx_size]);
                @memcpy(idx_dst[0..idx_size], cmd_list.IdxBuffer.Data[0..idx_size]);
                vtx_dst = vtx_dst[vtx_size..];
                idx_dst = idx_dst[idx_size..];
                vb_write_size += vtx_size;
                ib_write_size += idx_size;
            }
            vb_write_size = alignUp(vb_write_size, 4);
            ib_write_size = alignUp(ib_write_size, 4);
            if (vb_write_size > 0)
                bd.queue.writeBuffer(fr.vertex_buffer.?, 0, fr.vertices.?[0..vb_write_size]);
            if (ib_write_size > 0)
                bd.queue.writeBuffer(fr.index_buffer.?, 0, fr.indices.?[0..ib_write_size]);

            // Setup desired render state
            bd.setupRenderState(draw_data, pass_encoder, fr);

            // Render command lists
            var global_vtx_offset: c_uint = 0;
            var global_idx_offset: c_uint = 0;
            const clip_scale = draw_data.FramebufferScale;
            const clip_off = draw_data.DisplayPos;
            for (0..@intCast(draw_data.CmdListsCount)) |n| {
                const cmd_list = draw_data.CmdLists.Data[n];
                for (0..@intCast(cmd_list.CmdBuffer.Size)) |cmd_i| {
                    const pcmd = &cmd_list.CmdBuffer.Data[cmd_i];
                    if (pcmd.UserCallback != null) {
                        // TODO - imgui.DrawCallback_ResetRenderState not generating yet
                        pcmd.UserCallback.?(cmd_list, pcmd);
                    } else {
                        // Texture
                        const tex_id = imgui.DrawCmd_GetTexID(pcmd);
                        var entry = try device_resources.image_bind_groups.getOrPut(allocator, tex_id);
                        if (!entry.found_existing) {
                            entry.value_ptr.* = bd.device.createBindGroup(
                                &gpu.BindGroup.Descriptor.init(.{
                                    .layout = device_resources.image_bind_group_layout,
                                    .entries = &[_]gpu.BindGroup.Entry{
                                        .{ .binding = 0, .texture_view = @ptrCast(tex_id), .size = 0 },
                                    },
                                }),
                            );
                        }

                        const bind_group = entry.value_ptr.*;
                        pass_encoder.setBindGroup(1, bind_group, &.{});

                        // Scissor
                        const clip_min: imgui.Vec2 = .{
                            .x = (pcmd.ClipRect.x - clip_off.x) * clip_scale.x,
                            .y = (pcmd.ClipRect.y - clip_off.y) * clip_scale.y,
                        };
                        const clip_max: imgui.Vec2 = .{
                            .x = (pcmd.ClipRect.z - clip_off.x) * clip_scale.x,
                            .y = (pcmd.ClipRect.w - clip_off.y) * clip_scale.y,
                        };
                        if (clip_max.x <= clip_min.x or clip_max.y <= clip_min.y)
                            continue;

                        pass_encoder.setScissorRect(
                            @intFromFloat(clip_min.x),
                            @intFromFloat(clip_min.y),
                            @intFromFloat(clip_max.x - clip_min.x),
                            @intFromFloat(clip_max.y - clip_min.y),
                        );

                        // Draw
                        pass_encoder.drawIndexed(pcmd.ElemCount, 1, @intCast(pcmd.IdxOffset + global_idx_offset), @intCast(pcmd.VtxOffset + global_vtx_offset), 0);
                    }
                }
                global_idx_offset += @intCast(cmd_list.IdxBuffer.Size);
                global_vtx_offset += @intCast(cmd_list.VtxBuffer.Size);
            }
        }
    }

    fn setupRenderState(
        bd: *BackendRendererData,
        draw_data: *imgui.DrawData,
        pass_encoder: *gpu.RenderPassEncoder,
        fr: *FrameResources,
    ) void {
        if (bd.device_resources) |device_resources| {
            const L = draw_data.DisplayPos.x;
            const R = draw_data.DisplayPos.x + draw_data.DisplaySize.x;
            const T = draw_data.DisplayPos.y;
            const B = draw_data.DisplayPos.y + draw_data.DisplaySize.y;

            const uniforms: Uniforms = .{
                .MVP = [4][4]f32{
                    [4]f32{ 2.0 / (R - L), 0.0, 0.0, 0.0 },
                    [4]f32{ 0.0, 2.0 / (T - B), 0.0, 0.0 },
                    [4]f32{ 0.0, 0.0, 0.5, 0.0 },
                    [4]f32{ (R + L) / (L - R), (T + B) / (B - T), 0.5, 1.0 },
                },
            };
            bd.queue.writeBuffer(device_resources.uniforms, 0, &[_]Uniforms{uniforms});

            const width = draw_data.FramebufferScale.x * draw_data.DisplaySize.x;
            const height = draw_data.FramebufferScale.y * draw_data.DisplaySize.y;
            const index_format: gpu.IndexFormat = if (@sizeOf(imgui.DrawIdx) == 2) .uint16 else .uint32;

            pass_encoder.setViewport(0, 0, width, height, 0, 1);
            pass_encoder.setVertexBuffer(0, fr.vertex_buffer.?, 0, fr.vertex_buffer_size * @sizeOf(imgui.DrawVert));
            pass_encoder.setIndexBuffer(fr.index_buffer.?, index_format, 0, fr.index_buffer_size * @sizeOf(imgui.DrawIdx));
            pass_encoder.setPipeline(device_resources.pipeline);
            pass_encoder.setBindGroup(0, device_resources.common_bind_group, &.{});
        }
    }
};

const DeviceResources = struct {
    pipeline: *gpu.RenderPipeline,
    font_texture: *gpu.Texture,
    font_texture_view: *gpu.TextureView,
    sampler: *gpu.Sampler,
    uniforms: *gpu.Buffer,
    common_bind_group: *gpu.BindGroup,
    image_bind_groups: std.AutoArrayHashMapUnmanaged(imgui.TextureID, *gpu.BindGroup),
    image_bind_group: *gpu.BindGroup,
    image_bind_group_layout: *gpu.BindGroupLayout,
    frame_resources: []FrameResources,

    pub fn init(bd: *BackendRendererData) !DeviceResources {
        // Bind Group layouts
        const common_bind_group_layout = bd.device.createBindGroupLayout(
            &gpu.BindGroupLayout.Descriptor.init(.{
                .entries = &[_]gpu.BindGroupLayout.Entry{
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
                },
            }),
        );
        defer common_bind_group_layout.release();

        const image_bind_group_layout = bd.device.createBindGroupLayout(
            &gpu.BindGroupLayout.Descriptor.init(.{
                .entries = &[_]gpu.BindGroupLayout.Entry{
                    .{
                        .binding = 0,
                        .visibility = .{ .fragment = true },
                        .texture = .{ .sample_type = .float, .view_dimension = .dimension_2d },
                    },
                },
            }),
        );
        errdefer image_bind_group_layout.release();

        // Pipeline layout
        const pipeline_layout = bd.device.createPipelineLayout(
            &gpu.PipelineLayout.Descriptor.init(.{
                .bind_group_layouts = &[2]*gpu.BindGroupLayout{
                    common_bind_group_layout,
                    image_bind_group_layout,
                },
            }),
        );
        defer pipeline_layout.release();

        // Shaders
        const shader_module = bd.device.createShaderModuleWGSL("shader.wgsl", @embedFile("shader.wgsl"));
        defer shader_module.release();

        // Pipeline
        const pipeline = bd.device.createRenderPipeline(
            &.{
                .layout = pipeline_layout,
                .vertex = gpu.VertexState.init(.{
                    .module = shader_module,
                    .entry_point = "vertex_main",
                    .buffers = &[_]gpu.VertexBufferLayout{
                        gpu.VertexBufferLayout.init(.{
                            .array_stride = @sizeOf(imgui.DrawVert),
                            .step_mode = .vertex,
                            .attributes = &[_]gpu.VertexAttribute{
                                .{ .format = .float32x2, .offset = @offsetOf(imgui.DrawVert, "pos"), .shader_location = 0 },
                                .{ .format = .float32x2, .offset = @offsetOf(imgui.DrawVert, "uv"), .shader_location = 1 },
                                .{ .format = .unorm8x4, .offset = @offsetOf(imgui.DrawVert, "col"), .shader_location = 2 },
                            },
                        }),
                    },
                }),
                .primitive = .{
                    .topology = .triangle_list,
                    .strip_index_format = .undefined,
                    .front_face = .cw,
                    .cull_mode = .none,
                },
                .depth_stencil = if (bd.depth_stencil_format == .undefined) null else &.{
                    .format = bd.depth_stencil_format,
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
                .fragment = &gpu.FragmentState.init(.{
                    .module = shader_module,
                    .entry_point = "fragment_main",
                    .targets = &[_]gpu.ColorTargetState{.{
                        .format = bd.color_format,
                        .blend = &.{
                            .alpha = .{ .operation = .add, .src_factor = .one, .dst_factor = .one_minus_src_alpha },
                            .color = .{ .operation = .add, .src_factor = .src_alpha, .dst_factor = .one_minus_src_alpha },
                        },
                        .write_mask = gpu.ColorWriteMaskFlags.all,
                    }},
                }),
            },
        );
        errdefer pipeline.release();

        // Font Texture
        const io = imgui.GetIO();
        var pixels: ?*c_char = undefined;
        var width: c_int = undefined;
        var height: c_int = undefined;
        var size_pp: c_int = undefined;
        imgui.FontAtlas_GetTexDataAsRGBA32(io.Fonts.?, &pixels, &width, &height, &size_pp);
        const pixels_data: ?[*]c_char = @ptrCast(pixels);

        const font_texture = bd.device.createTexture(&.{
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
        });
        errdefer font_texture.release();

        const font_texture_view = font_texture.createView(null);
        errdefer font_texture_view.release();

        bd.queue.writeTexture(
            &.{
                .texture = font_texture,
                .mip_level = 0,
                .origin = .{ .x = 0, .y = 0, .z = 0 },
                .aspect = .all,
            },
            &.{
                .offset = 0,
                .bytes_per_row = @intCast(width * size_pp),
                .rows_per_image = @intCast(height),
            },
            &.{ .width = @intCast(width), .height = @intCast(height), .depth_or_array_layers = 1 },
            pixels_data.?[0..@intCast(width * size_pp * height)],
        );

        // Sampler
        const sampler = bd.device.createSampler(&.{
            .min_filter = .linear,
            .mag_filter = .linear,
            .mipmap_filter = .linear,
            .address_mode_u = .repeat,
            .address_mode_v = .repeat,
            .address_mode_w = .repeat,
            .max_anisotropy = 1,
        });
        errdefer sampler.release();

        // Uniforms
        const uniforms = bd.device.createBuffer(&.{
            .label = "Dear ImGui Uniform buffer",
            .usage = .{ .copy_dst = true, .uniform = true },
            .size = alignUp(@sizeOf(Uniforms), 16),
        });
        errdefer uniforms.release();

        // Common Bind Group
        const common_bind_group = bd.device.createBindGroup(
            &gpu.BindGroup.Descriptor.init(.{
                .layout = common_bind_group_layout,
                .entries = &[_]gpu.BindGroup.Entry{
                    .{ .binding = 0, .buffer = uniforms, .offset = 0, .size = alignUp(@sizeOf(Uniforms), 16) },
                    .{ .binding = 1, .sampler = sampler, .size = 0 },
                },
            }),
        );
        errdefer common_bind_group.release();

        // Image Bind Group
        const image_bind_group = bd.device.createBindGroup(
            &gpu.BindGroup.Descriptor.init(.{
                .layout = image_bind_group_layout,
                .entries = &[_]gpu.BindGroup.Entry{
                    .{ .binding = 0, .texture_view = font_texture_view, .size = 0 },
                },
            }),
        );
        errdefer image_bind_group.release();

        // Image Bind Groups
        var image_bind_groups = std.AutoArrayHashMapUnmanaged(imgui.TextureID, *gpu.BindGroup){};
        errdefer image_bind_groups.deinit(allocator);

        try image_bind_groups.put(allocator, font_texture_view, image_bind_group);

        // Frame Resources
        const frame_resources = try allocator.alloc(FrameResources, bd.max_frames_in_flight);
        for (0..bd.max_frames_in_flight) |i| {
            var fr = &frame_resources[i];
            fr.index_buffer = null;
            fr.vertex_buffer = null;
            fr.indices = null;
            fr.vertices = null;
            fr.index_buffer_size = 10000;
            fr.vertex_buffer_size = 5000;
        }

        // ImGui
        imgui.FontAtlas_SetTexID(io.Fonts.?, font_texture_view);

        // Result
        return .{
            .pipeline = pipeline,
            .font_texture = font_texture,
            .font_texture_view = font_texture_view,
            .sampler = sampler,
            .uniforms = uniforms,
            .common_bind_group = common_bind_group,
            .image_bind_group = image_bind_group,
            .image_bind_groups = image_bind_groups,
            .image_bind_group_layout = image_bind_group_layout,
            .frame_resources = frame_resources,
        };
    }

    pub fn deinit(dr: *DeviceResources) void {
        var io = imgui.GetIO();
        imgui.FontAtlas_SetTexID(io.Fonts.?, null);

        dr.pipeline.release();
        dr.font_texture.release();
        dr.font_texture_view.release();
        dr.sampler.release();
        dr.uniforms.release();
        dr.common_bind_group.release();
        for (dr.image_bind_groups.values()) |x| x.release();
        dr.image_bind_group.release();
        dr.image_bind_group_layout.release();
        for (dr.frame_resources) |*frame_resources| frame_resources.release();

        dr.image_bind_groups.deinit(allocator);
        allocator.free(dr.frame_resources);
    }
};

const FrameResources = struct {
    index_buffer: ?*gpu.Buffer,
    vertex_buffer: ?*gpu.Buffer,
    indices: ?[]imgui.DrawIdx,
    vertices: ?[]imgui.DrawVert,
    index_buffer_size: usize,
    vertex_buffer_size: usize,

    pub fn release(fr: *FrameResources) void {
        if (fr.index_buffer) |x| x.release();
        if (fr.vertex_buffer) |x| x.release();
        if (fr.indices) |x| allocator.free(x);
        if (fr.vertices) |x| allocator.free(x);
    }
};