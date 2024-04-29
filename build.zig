const std = @import("std");
const builtin = @import("builtin");

pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const use_freetype = b.option(bool, "use_freetype", "Use Freetype") orelse false;
    const enable_glfw_backend = b.option(bool, "enable_glfw", "Enable the GLFW platform backend") orelse false;
    const enable_opengl3_backend = b.option(bool, "enable_opengl3", "Enable the OpenGL3 renderer backend") orelse false;
    const enable_vulkan_backend = b.option(bool, "enable_vulkan", "Enable the Vulkan renderer backend") orelse false;

    var build_options = b.addOptions();
    build_options.addOption(bool, "enable_glfw_backend", enable_glfw_backend);
    build_options.addOption(bool, "enable_opengl3_backend", enable_opengl3_backend);
    build_options.addOption(bool, "enable_vulkan_backend", enable_vulkan_backend);

    const module = b.addModule("zig-imgui", .{
        .root_source_file = b.path("src/imgui.zig"),
    });
    module.addOptions("build_options", build_options);

    const lib = b.addStaticLibrary(.{
        .name = "imgui",
        .root_source_file = .{ .path = "src/cimgui.cpp" },
        .target = target,
        .optimize = optimize,
    });
    lib.linkLibC();

    const imgui_dep = b.lazyDependency("imgui", .{}).?;

    lib.addIncludePath(imgui_dep.path("backends"));

    var files = std.ArrayList([]const u8).init(b.allocator);
    defer files.deinit();

    var flags = std.ArrayList([]const u8).init(b.allocator);
    defer flags.deinit();

    try files.appendSlice(&.{
        imgui_dep.path("imgui.cpp").getPath(b),
        imgui_dep.path("imgui_widgets.cpp").getPath(b),
        imgui_dep.path("imgui_tables.cpp").getPath(b),
        imgui_dep.path("imgui_draw.cpp").getPath(b),
        imgui_dep.path("imgui_demo.cpp").getPath(b),
    });

    if (use_freetype) {
        try flags.append("-DIMGUI_ENABLE_FREETYPE");
        try files.append("imgui/misc/freetype/imgui_freetype.cpp");

        lib.linkLibrary(b.dependency("freetype", .{
            .target = target,
            .optimize = optimize,
        }).artifact("freetype"));
    }

    if (enable_glfw_backend) {
        const glfw_dep = b.dependency("glfw", .{ .target = target, .optimize = optimize });
        lib.linkLibrary(glfw_dep.artifact("glfw"));
        //@import("glfw").link(b, lib);

        try files.append(imgui_dep.path("backends/imgui_impl_glfw.cpp").getPath(b));
        try files.append("src/imgui_impl_glfw_wrapper.cpp");
    }

    if (enable_opengl3_backend) {
        try files.append(imgui_dep.path("backends/imgui_impl_opengl3.cpp").getPath(b));
        try files.append("src/imgui_impl_opengl3_wrapper.cpp");
    }

    if (enable_vulkan_backend) {
        try files.append(imgui_dep.path("backends/imgui_impl_vulkan.cpp").getPath(b));
        try files.append("src/imgui_impl_vulkan_wrapper.cpp");
        try flags.append("-DIMGUI_IMPL_VULKAN_NO_PROTOTYPES");

        lib.linkLibrary(b.dependency("vulkan_headers", .{
            .target = target,
            .optimize = optimize,
        }).artifact("vulkan-headers"));
    }

    lib.addIncludePath(imgui_dep.path("."));
    lib.addCSourceFiles(.{
        .files = files.items,
        .flags = flags.items,
    });
    b.installArtifact(lib);

    // Generator
    const generator_exe = b.addExecutable(.{
        .name = "mach-imgui-generator",
        .root_source_file = .{ .path = "src/generate.zig" },
        .target = target,
        .optimize = optimize,
    });

    b.installArtifact(generator_exe);

    const generate_step = b.step("generate", "Generate the bindings");
    generate_step.dependOn(&b.addRunArtifact(generator_exe).step);
}
