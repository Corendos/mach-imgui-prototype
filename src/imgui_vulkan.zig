const imgui = @import("imgui.zig");
const vk = @cImport(@cInclude("vulkan/vulkan.h"));

pub const InitInfo = extern struct {
    instance: vk.VkInstance = null,
    physical_device: vk.VkPhysicalDevice = null,
    device: vk.VkDevice = null,
    queue_family: u32 = 0,
    queue: vk.VkQueue = null,
    pipeline_cache: vk.VkPipelineCache = null,
    descriptor_pool: vk.VkDescriptorPool = null,
    subpass: u32 = 0,
    min_image_count: u32 = 0,
    image_count: u32 = 0,
    msaa_samples: vk.VkSampleCountFlagBits = 0,
    use_dynamic_rendering: bool = false,
    color_attachment_format: vk.VkFormat = 0,
    allocator: ?*vk.VkAllocationCallbacks = null,
    checkVkResultFn: ?*const fn (err: vk.VkResult) callconv(.C) void = null,
};

const vkVoidFunction = *const fn () callconv(.C) void;

extern fn ImGui_ImplVulkan_InitC(info: *InitInfo, render_pass: vk.VkRenderPass) bool;
extern fn ImGui_ImplVulkan_ShutdownC() void;
extern fn ImGui_ImplVulkan_NewFrameC() void;
extern fn ImGui_ImplVulkan_RenderDrawDataC(draw_data: *imgui.DrawData, command_buffer: vk.VkCommandBuffer, pipeline: vk.VkPipeline) void;
extern fn ImGui_ImplVulkan_CreateFontsTextureC(command_buffer: vk.VkCommandBuffer) bool;
extern fn ImGui_ImplVulkan_DestroyFontUploadObjectsC() void;
extern fn ImGui_ImplVulkan_SetMinImageCountC(min_image_count: u32) void;
extern fn ImGui_ImplVulkan_LoadFunctionsC(loader_func: *const fn (function_name: [*:0]const u8, userdata: ?*anyopaque) callconv(.C) ?vkVoidFunction, userdata: ?*anyopaque) bool;

pub fn init(info: *InitInfo, render_pass: vk.VkRenderPass) bool {
    return ImGui_ImplVulkan_InitC(info, render_pass);
}

pub fn shutdown() void {
    return ImGui_ImplVulkan_ShutdownC();
}

pub fn newFrame() void {
    return ImGui_ImplVulkan_NewFrameC();
}

pub fn renderDrawData(draw_data: *imgui.DrawData, command_buffer: vk.VkCommandBuffer, pipeline: vk.VkPipeline) void {
    return ImGui_ImplVulkan_RenderDrawDataC(draw_data, command_buffer, pipeline);
}

pub fn createFontsTexture(command_buffer: vk.VkCommandBuffer) bool {
    return ImGui_ImplVulkan_CreateFontsTextureC(command_buffer);
}

pub fn destroyFontUploadObjects() void {
    return ImGui_ImplVulkan_DestroyFontUploadObjectsC();
}

pub fn setMinImageCount(min_image_count: u32) void {
    return setMinImageCount(min_image_count);
}

pub fn loadFunctions(loader_func: *const fn (function_name: [*:0]const u8, userdata: ?*anyopaque) callconv(.C) ?vkVoidFunction, userdata: ?*anyopaque) bool {
    return ImGui_ImplVulkan_LoadFunctionsC(loader_func, userdata);
}
