const std = @import("std");

pub const Sample = struct {
    x: i32,

    pub fn init() Sample {
        return Sample{ .x = 0 };
    }

    pub fn setX(self: *Sample, new_value: i32) void {
        self.x = new_value;
    }

    pub fn getX(self: *const Sample) i32 {
        return self.x;
    }
};

test "Sample default value" {
    const s = Sample.init();
    try std.testing.expectEqual(0, s.getX());
}

test "Sample set and get" {
    var s = Sample.init();
    s.setX(42);
    try std.testing.expectEqual(42, s.getX());
}
