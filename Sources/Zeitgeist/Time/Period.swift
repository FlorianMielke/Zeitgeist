import Foundation

public struct Period: Equatable, Hashable, Comparable {
  public static let current = Period(starts: Time(), ends: Time(), allDay: false)
  public let starts: Time
  public let ends: Time
  public let allDay: Bool
  
  public var duration: Duration { starts.duration(to: ends) }
  public var maximized: Period { Period(starts: starts.starts, ends: ends.ends) }

  public init(starts: Time, ends: Time, allDay: Bool) {
    self.starts = starts
    self.ends = ends
    self.allDay = allDay
  }
  
  public init(starts: Time, ends: Time) {
    self.init(starts: starts, ends: ends, allDay: false)
  }
  
  public static func <(lhs: Period, rhs: Period) -> Bool {
    return  (lhs.starts < rhs.starts) ||
            (lhs.starts == rhs.starts && lhs.duration < rhs.duration)
  }
  
  public func endsLater(then other: Period) -> Bool {
    return ends > other.ends
  }

  public func startsEarlier(then other: Period) -> Bool {
    return starts < other.starts
  }
}
