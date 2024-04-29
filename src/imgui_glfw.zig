extern fn ImGui_ImplGlfw_InitForOpenGLC(window: *anyopaque, install_callbacks: bool) bool;
extern fn ImGui_ImplGlfw_InitForVulkanC(window: *anyopaque, install_callbacks: bool) bool;
extern fn ImGui_ImplGlfw_InitForOtherC(window: *anyopaque, install_callbacks: bool) bool;
extern fn ImGui_ImplGlfw_ShutdownC() void;
extern fn ImGui_ImplGlfw_NewFrameC() void;

pub fn initOpenGl(window: *anyopaque, install_callbacks: bool) bool {
    return ImGui_ImplGlfw_InitForOpenGLC(window, install_callbacks);
}

pub fn initVulkan(window: *anyopaque, install_callbacks: bool) bool {
    return ImGui_ImplGlfw_InitForVulkanC(window, install_callbacks);
}

pub fn initOtherGl(window: *anyopaque, install_callbacks: bool) bool {
    return ImGui_ImplGlfw_InitForOtherC(window, install_callbacks);
}

pub fn shutdown() void {
    return ImGui_ImplGlfw_ShutdownC();
}

pub fn newFrame() void {
    return ImGui_ImplGlfw_NewFrameC();
}
