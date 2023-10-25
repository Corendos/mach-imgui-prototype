const std = @import("std");
const imgui = @import("imgui.zig");
const imgui_mach_gpu = @import("imgui_mach_gpu.zig");
const core = @import("mach-core");
const gpu = core.gpu;

pub const App = @This();

pub const mach_core_options = core.ComptimeOptions{
    .use_wgpu = false,
    .use_dgpu = true,
};

var gpa = std.heap.GeneralPurposeAllocator(.{}){};

title_timer: core.Timer,
f: f32 = 0.0,

pub fn init(app: *App) !void {
    try core.init(.{});

    const allocator = gpa.allocator();

    _ = imgui.CreateContext(null);
    try imgui_mach_gpu.init(allocator, core.device, 3, .bgra8_unorm, .undefined); // TODO - use swap chain preferred format

    var io = imgui.GetIO();

    // Build atlas
    var tex_pixels: ?*c_char = undefined;
    var tex_w: c_int = undefined;
    var tex_h: c_int = undefined;
    var bytes_per_pixel: c_int = undefined;
    imgui.FontAtlas_GetTexDataAsRGBA32(io.Fonts.?, &tex_pixels, &tex_w, &tex_h, &bytes_per_pixel);

    app.* = .{
        .title_timer = try core.Timer.start(),
    };
}

pub fn deinit(app: *App) void {
    _ = app;
    defer _ = gpa.deinit();
    defer core.deinit();

    imgui_mach_gpu.shutdown();
    imgui.DestroyContext(null);
}

pub fn update(app: *App) !bool {
    var iter = core.pollEvents();
    while (iter.next()) |event| {
        switch (event) {
            .key_press => |ev| {
                if (ev.key == .space) return true;
            },
            .close => return true,
            else => {},
        }
    }

    try app.render();

    // update the window title every second
    if (app.title_timer.read() >= 1.0) {
        app.title_timer.reset();
        try core.printTitle("Clear Color [ {d}fps ] [ Input {d}hz ]", .{
            core.frameRate(),
            core.inputRate(),
        });
    }

    return false;
}

fn render(app: *App) !void {
    var io = imgui.GetIO();
    io.DisplaySize = imgui.Vec2{ .x = 1920, .y = 1080 };
    io.DeltaTime = 1.0 / 60.0;

    imgui_mach_gpu.newFrame() catch return;
    imgui.NewFrame();

    imgui.Text("Hello, world!");
    _ = imgui.SliderFloat("float", &app.f, 0.0, 1.0);
    imgui.Text("Application average %.3f ms/frame (%.1f FPS)", 1000.0 / io.Framerate, io.Framerate);
    imgui.ShowDemoWindow(null);

    imgui.Render();

    const back_buffer_view = core.swap_chain.getCurrentTextureView().?;
    const color_attachment = gpu.RenderPassColorAttachment{
        .view = back_buffer_view,
        .clear_value = gpu.Color{ .r = 0.0, .g = 0.0, .b = 1.0, .a = 1.0 },
        .load_op = .clear,
        .store_op = .store,
    };

    const encoder = core.device.createCommandEncoder(null);
    const render_pass_info = gpu.RenderPassDescriptor.init(.{
        .color_attachments = &.{color_attachment},
    });

    const pass = encoder.beginRenderPass(&render_pass_info);
    imgui_mach_gpu.renderDrawData(imgui.GetDrawData().?, pass) catch {};
    pass.end();
    pass.release();

    var command = encoder.finish(null);
    encoder.release();

    var queue = core.queue;
    queue.submit(&[_]*gpu.CommandBuffer{command});
    command.release();
    core.swap_chain.present();
    back_buffer_view.release();
}

test {
    std.testing.refAllDeclsRecursive(@This());
}
