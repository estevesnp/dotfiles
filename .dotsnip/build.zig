const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const use_llvm = b.option(bool, "llvm", "Use LLVM for executable");

    const mod = b.createModule(.{
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    const exe = b.addExecutable(.{
        .name = "<your exe name here>",
        .root_module = mod,
        .use_llvm = use_llvm,
    });

    b.installArtifact(exe);

    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());
    run_cmd.addPassthruArgs();

    const run_step = b.step("run", "run app");
    run_step.dependOn(&run_cmd.step);

    // tests
    const filters = b.option([]const []const u8, "test-filter", "Test filters") orelse &.{};
    const tests_exe = b.addTest(.{
        .filters = filters,
        .use_llvm = use_llvm,
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/tests.zig"),
            .target = target,
            .optimize = optimize,
        }),
    });
    const run_tests_exe = b.addRunArtifact(tests_exe);

    const test_step = b.step("test", "Run tests");
    test_step.dependOn(&run_tests_exe.step);

    // check
    const check_exe = b.addExecutable(.{
        .name = "check",
        .root_module = mod,
        .use_llvm = use_llvm,
    });

    const check_step = b.step("check", "Check app compiles");
    check_step.dependOn(&check_exe.step);
    check_step.dependOn(&tests_exe.step);
}
