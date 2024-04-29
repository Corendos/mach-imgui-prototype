struct GLFWwindow;

bool ImGui_ImplGlfw_InitForOpenGL(GLFWwindow* window, bool install_callbacks);
bool ImGui_ImplGlfw_InitForVulkan(GLFWwindow* window, bool install_callbacks);
bool ImGui_ImplGlfw_InitForOther(GLFWwindow* window, bool install_callbacks);
void ImGui_ImplGlfw_Shutdown();
void ImGui_ImplGlfw_NewFrame();

extern "C" {

bool ImGui_ImplGlfw_InitForOpenGLC(GLFWwindow* window, bool install_callbacks) {
    return ImGui_ImplGlfw_InitForOpenGL(window, install_callbacks);
}

bool ImGui_ImplGlfw_InitForVulkanC(GLFWwindow* window, bool install_callbacks) {
    return ImGui_ImplGlfw_InitForVulkan(window, install_callbacks);
}

bool ImGui_ImplGlfw_InitForOtherC(GLFWwindow* window, bool install_callbacks) {
    return ImGui_ImplGlfw_InitForOther(window, install_callbacks);
}

void ImGui_ImplGlfw_ShutdownC() {
    return ImGui_ImplGlfw_Shutdown();
}

void ImGui_ImplGlfw_NewFrameC() {
    return ImGui_ImplGlfw_NewFrame();
}

}
