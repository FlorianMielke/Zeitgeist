import Foundation

public struct UTCTime: Equatable, Hashable {
  public let time: Time
  
  public init(at date: Date = Travel.now) {
    time = Time(at: date, calendar: Calendar.utc)
  }
}

extension Calendar {
  public static var utc: Calendar {
    var calendar = Calendar.current
    calendar.timeZone = TimeZone.utc
    return calendar
  }
}

public extension TimeZone {
  static var utc: TimeZone {
    return TimeZone(secondsFromGMT: 0)!
  }
}
