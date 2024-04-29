#include <imgui_impl_vulkan.h>

typedef void (*PFN_vkVoidFunction)(void);

extern "C" {
bool ImGui_ImplVulkan_InitC(ImGui_ImplVulkan_InitInfo* info, VkRenderPass render_pass) {
    return ImGui_ImplVulkan_Init(info, render_pass);
}

void ImGui_ImplVulkan_ShutdownC() {
    return ImGui_ImplVulkan_Shutdown();
}

void ImGui_ImplVulkan_NewFrameC() {
    return ImGui_ImplVulkan_NewFrame();
}

void ImGui_ImplVulkan_RenderDrawDataC(ImDrawData* draw_data, VkCommandBuffer command_buffer, VkPipeline pipeline) {
return ImGui_ImplVulkan_RenderDrawData(draw_data, command_buffer, pipeline);
}

bool ImGui_ImplVulkan_CreateFontsTextureC(VkCommandBuffer command_buffer) {
    return ImGui_ImplVulkan_CreateFontsTexture(command_buffer);
}

void ImGui_ImplVulkan_DestroyFontUploadObjectsC() {
    ImGui_ImplVulkan_DestroyFontUploadObjects();
}

void ImGui_ImplVulkan_SetMinImageCountC(uint32_t min_image_count) {
    return ImGui_ImplVulkan_SetMinImageCount(min_image_count);
}

bool ImGui_ImplVulkan_LoadFunctionsC(PFN_vkVoidFunction(*loader_func)(const char* function_name, void* user_data), void* user_data) {
    return ImGui_ImplVulkan_LoadFunctions(loader_func, user_data);
}

}
