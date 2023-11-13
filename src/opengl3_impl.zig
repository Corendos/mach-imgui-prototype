const glfw = @import("glfw");

pub fn init(glsl_version: ?[*:0]const u8) bool {
    return ImGui_ImplOpenGL3_InitC(glsl_version);
}

pub fn shutdown() void {
    return ImGui_ImplOpenGL3_ShutdownC();
}

pub fn newFrame() void {
    return ImGui_ImplOpenGL3_NewFrameC();
}

pub fn renderDrawData(draw_data: ?*anyopaque) void {
    return ImGui_ImplOpenGL3_RenderDrawDataC(draw_data);
}

extern fn ImGui_ImplOpenGL3_InitC(glsl_version: ?[*:0]const u8) bool;
extern fn ImGui_ImplOpenGL3_ShutdownC() void;
extern fn ImGui_ImplOpenGL3_NewFrameC() void;
extern fn ImGui_ImplOpenGL3_RenderDrawDataC(draw_data: ?*anyopaque) void;
