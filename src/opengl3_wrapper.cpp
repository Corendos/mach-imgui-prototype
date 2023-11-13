#include <backends/imgui_impl_opengl3.h>

extern "C" {
bool ImGui_ImplOpenGL3_InitC(const char* glsl_version = nullptr) {
    return ImGui_ImplOpenGL3_Init(glsl_version);
}

void ImGui_ImplOpenGL3_ShutdownC() {
    return ImGui_ImplOpenGL3_Shutdown();
}

void ImGui_ImplOpenGL3_NewFrameC() {
    return ImGui_ImplOpenGL3_NewFrame();
}

void ImGui_ImplOpenGL3_RenderDrawDataC(ImDrawData* draw_data) {
    return ImGui_ImplOpenGL3_RenderDrawData(draw_data);
}

}
