const std = @import("std");
const builtin = @import("builtin");

const mach_core = @import("mach_core");

pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const use_freetype = b.option(bool, "use_freetype", "Use Freetype") orelse false;

    const lib = b.addStaticLibrary(.{
        .name = "imgui",
        .root_source_file = .{ .path = "imgui/cimgui.cpp" },
        .target = target,
        .optimize = optimize,
    });
    lib.linkLibC();

    var files = std.ArrayList([]const u8).init(b.allocator);
    defer files.deinit();

    var flags = std.ArrayList([]const u8).init(b.allocator);
    defer flags.deinit();

    try files.appendSlice(&.{
        "imgui/imgui.cpp",
        "imgui/imgui_widgets.cpp",
        "imgui/imgui_tables.cpp",
        "imgui/imgui_draw.cpp",
        "imgui/imgui_demo.cpp",
    });

    if (use_freetype) {
        try flags.append("-DIMGUI_ENABLE_FREETYPE");
        try files.append("imgui/misc/freetype/imgui_freetype.cpp");

        lib.linkLibrary(b.dependency("freetype", .{
            .target = target,
            .optimize = optimize,
        }).artifact("freetype"));
    }

    lib.addIncludePath(.{ .path = "imgui" });
    lib.addCSourceFiles(.{
        .files = files.items,
        .flags = flags.items,
    });
    b.installArtifact(lib);

    // Example
    const mach_core_dep = b.dependency("mach_core", .{
        .target = target,
        .optimize = optimize,
    });
    const app = try mach_core.App.init(b, mach_core_dep.builder, .{
        .name = "mach-imgui-example",
        .src = "src/main.zig",
        .target = target,
        .deps = &[_]std.build.ModuleDependency{},
        .optimize = optimize,
    });
    app.compile.linkLibrary(lib);

    const mach_dusk_dep = b.dependency("mach_dusk", .{
        .target = target,
        .optimize = optimize,
    });
    app.compile.linkLibrary(mach_dusk_dep.artifact("mach-dusk"));
    @import("mach_dusk").link(mach_dusk_dep.builder, app.compile);

    const run_step = b.step("run", "Run the example");
    run_step.dependOn(&app.run.step);

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
