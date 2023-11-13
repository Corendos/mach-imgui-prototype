const std = @import("std");
const builtin = @import("builtin");

const mach_core = @import("mach_core");

pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const use_freetype = b.option(bool, "use_freetype", "Use Freetype") orelse false;
    const use_glfw = b.option(bool, "use_glfw", "Use GLFW") orelse false;
    const use_opengl3 = b.option(bool, "use_opengl3", "Use OpenGL 3.0") orelse false;

    const module = b.addModule("zig-imgui", .{
        .root_source_file = b.path("src/imgui.zig"),
    });
    _ = module; // autofix

    const lib = b.addStaticLibrary(.{
        .name = "imgui",
        .target = target,
        .optimize = optimize,
    });
    lib.addCSourceFile(.{ .file = b.path("src/cimgui.cpp") });
    lib.linkLibC();
    lib.linkLibCpp();

    const imgui_dep = b.dependency("imgui", .{});

    var files = std.ArrayList([]const u8).init(b.allocator);
    defer files.deinit();

    var flags = std.ArrayList([]const u8).init(b.allocator);
    defer flags.deinit();

    try files.appendSlice(&.{
        "imgui.cpp",
        "imgui_widgets.cpp",
        "imgui_tables.cpp",
        "imgui_draw.cpp",
        "imgui_demo.cpp",
    });

    if (use_freetype) {
        try flags.append("-DIMGUI_ENABLE_FREETYPE");
        try files.append("imgui/misc/freetype/imgui_freetype.cpp");

        lib.linkLibrary(b.dependency("freetype", .{
            .target = target,
            .optimize = optimize,
        }).artifact("freetype"));
    }

    if (use_glfw) {
        try files.append("backends/imgui_impl_glfw.cpp");
        lib.addCSourceFile(.{ .file = b.path("src/glfw_wrapper.cpp") });

        const glfw_dep = b.dependency("glfw", .{
            .target = target,
            .optimize = optimize,
        });
        const glfw_lib = glfw_dep.artifact("glfw");
        lib.linkLibrary(glfw_lib);
    }

    if (use_opengl3) {
        try files.append("backends/imgui_impl_opengl3.cpp");
        lib.addCSourceFile(.{ .file = b.path("src/opengl3_wrapper.cpp") });
    }

    lib.addIncludePath(imgui_dep.path(""));
    lib.addCSourceFiles(.{
        .root = imgui_dep.path(""),
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
