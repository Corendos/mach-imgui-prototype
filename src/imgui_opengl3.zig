const imgui = @import("imgui.zig");

extern fn ImGui_ImplOpenGL3_Init(glsl_version: ?[*:0]const u8) bool;
extern fn ImGui_ImplOpenGL3_Shutdown() void;
extern fn ImGui_ImplOpenGL3_NewFrame() void;
extern fn ImGui_ImplOpenGL3_RenderDrawData(draw_data: *imgui.DrawData) void;

pub fn init(glsl_version: ?[:0]const u8) bool {
    return ImGui_ImplOpenGL3_Init(if (glsl_version) |v| v.ptr else null);
}

pub fn shutdown() void {
    return ImGui_ImplOpenGL3_Shutdown();
}

pub fn newFrame() void {
    return ImGui_ImplOpenGL3_NewFrame();
}

pub fn renderDrawData(draw_data: imgui.DrawData) void {
    return ImGui_ImplOpenGL3_RenderDrawData(draw_data);
}
