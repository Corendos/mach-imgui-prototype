const std = @import("std");
const builtin = @import("builtin");

const mach_core = @import("mach_core");

pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const mach_core_dep = b.dependency("mach_core", .{
        .target = target,
        .optimize = optimize,
    });

    const lib = b.addStaticLibrary(.{
        .name = "imgui",
        .root_source_file = .{ .path = "imgui/cimgui.cpp" },
        .target = target,
        .optimize = optimize,
    });
    lib.addCSourceFiles(.{
        .files = &.{
            "imgui/imgui.cpp",
            "imgui/imgui_widgets.cpp",
            "imgui/imgui_tables.cpp",
            "imgui/imgui_draw.cpp",
            "imgui/imgui_demo.cpp",
        },
        .flags = &.{},
    });
    b.installArtifact(lib);

    const app = try mach_core.App.init(b, mach_core_dep.builder, .{
        .name = "mach-imgui-example",
        .src = "src/main.zig",
        .target = target,
        .deps = &[_]std.build.ModuleDependency{},
        .optimize = optimize,
    });
    app.compile.linkLibrary(lib);

    const run_step = b.step("run", "Run the example");
    run_step.dependOn(&app.run.step);

    const generator_exe = b.addExecutable(.{
        .name = "mach-imgui-generator",
        .root_source_file = .{ .path = "src/generate.zig" },
        .target = target,
        .optimize = optimize,
    });

    b.installArtifact(generator_exe);

    const generate_step = b.step("generate", "Generate the bindings");
    generate_step.dependOn(&b.addRunArtifact(generator_exe).step);

    // const main_tests = b.addTest(.{
    //     .name = "mach-imgui-tests",
    //     .root_source_file = .{ .path = "src/main.zig" },
    //     .target = target,
    //     .optimize = optimize,
    // });
    // b.installArtifact(main_tests);

    // const test_step = b.step("test", "Run library tests");
    // test_step.dependOn(&b.addRunArtifact(main_tests).step);
}
