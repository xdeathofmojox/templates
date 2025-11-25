const std = @import("std");

pub fn build(b: *std.Build) void {
    // TODO: Rename lib-name
    const lib_name = "lib-name";

    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // Create the library module for other packages to use
    const lib_module = b.addModule(lib_name, .{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
    });

    // Create the static library
    const lib = b.addLibrary(.{
        .name = lib_name,
        .root_module = lib_module,
        .linkage = .static,
    });

    // Install the library
    b.installArtifact(lib);

    // Add unit tests
    const lib_unit_tests = b.addTest(.{
        .root_module = lib_module,
    });

    const run_lib_unit_tests = b.addRunArtifact(lib_unit_tests);

    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_lib_unit_tests.step);
}
