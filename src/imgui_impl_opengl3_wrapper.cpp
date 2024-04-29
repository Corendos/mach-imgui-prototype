struct ImDrawData;

bool ImGui_ImplOpenGL3_Init(const char* glsl_version);
void ImGui_ImplOpenGL3_Shutdown();
void ImGui_ImplOpenGL3_NewFrame();
void ImGui_ImplOpenGL3_RenderDrawData(ImDrawData* draw_data);

extern "C" {
bool ImGui_ImplOpenGL3_InitC(const char* glsl_version) {
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
