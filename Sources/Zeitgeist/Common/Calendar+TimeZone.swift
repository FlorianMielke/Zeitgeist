import Foundation

extension Calendar {
    public static func current(with durationFromGMT: Duration) -> Calendar? {
        guard let timeZone = TimeZone.withDurationFromGMT(durationFromGMT) else {
            return nil
        }
        return Calendar.current(with: timeZone)
    }
    
    public static func current(with timeZone: TimeZone) -> Calendar {
        var calendar = Calendar.current
        calendar.timeZone = timeZone
        return calendar
    }
}
