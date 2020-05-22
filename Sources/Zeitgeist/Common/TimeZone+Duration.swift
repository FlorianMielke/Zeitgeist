import Foundation

extension TimeZone {
    public static func withDurationFromGMT(_ duration: Duration) -> TimeZone? {
        return TimeZone(secondsFromGMT: duration.second)
    }
}
