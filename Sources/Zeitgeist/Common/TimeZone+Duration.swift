import Foundation

extension TimeZone {
    public static func durationFromGMT(_ duration: Duration) -> TimeZone? {
        return TimeZone(secondsFromGMT: duration.second)
    }
}
