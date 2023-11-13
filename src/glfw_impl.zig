const GLFWwindow = opaque {};
const GLFWmonitor = opaque {};

pub fn initForOpengl(window: *anyopaque, install_callbacks: bool) bool {
    return ImGui_ImplGlfw_InitForOpenGLC(window, install_callbacks);
}

pub fn initForVulkan(window: *anyopaque, install_callbacks: bool) bool {
    return ImGui_ImplGlfw_InitForVulkanC(window, install_callbacks);
}

pub fn initForOther(window: *anyopaque, install_callbacks: bool) bool {
    return ImGui_ImplGlfw_InitForOtherC(window, install_callbacks);
}

pub fn shutdown() void {
    return ImGui_ImplGlfw_ShutdownC();
}

pub fn newFrame() void {
    return ImGui_ImplGlfw_NewFrameC();
}

extern fn ImGui_ImplGlfw_InitForOpenGLC(window: *anyopaque, install_callbacks: bool) bool;
extern fn ImGui_ImplGlfw_InitForVulkanC(window: *anyopaque, install_callbacks: bool) bool;
extern fn ImGui_ImplGlfw_InitForOtherC(window: *anyopaque, install_callbacks: bool) bool;
extern fn ImGui_ImplGlfw_ShutdownC() void;
extern fn ImGui_ImplGlfw_NewFrameC() void;
