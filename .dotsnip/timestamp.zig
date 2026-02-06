pub const Timestamp = struct {
    year: u16,
    month: u4,
    day: u5,
    hours: u5,
    minutes: u6,
    seconds: u6,

    pub fn init(ts: Io.Timestamp) Timestamp {
        const e_secs: std.time.epoch.EpochSeconds = .{ .secs = @intCast(ts.toSeconds()) };
        const e_day_secs = e_secs.getDaySeconds();
        const e_day = e_secs.getEpochDay();
        const e_year_day = e_day.calculateYearDay();
        const e_month_day = e_year_day.calculateMonthDay();

        return .{
            .year = e_year_day.year,
            .month = e_month_day.month.numeric(),
            .day = e_month_day.day_index + 1,
            .hours = e_day_secs.getHoursIntoDay(),
            .minutes = e_day_secs.getMinutesIntoHour(),
            .seconds = e_day_secs.getSecondsIntoMinute(),
        };
    }

    pub fn now(io: Io) Timestamp {
        return init(Io.Clock.real.now(io));
    }

    pub fn format(self: Timestamp, writer: *Io.Writer) Io.Writer.Error!void {
        try writer.print("{d:04}-{d:02}-{d:02} {d:02}:{d:02}:{d:02}", .{
            self.year,
            self.month,
            self.day,
            self.hours,
            self.minutes,
            self.seconds,
        });
    }
};
