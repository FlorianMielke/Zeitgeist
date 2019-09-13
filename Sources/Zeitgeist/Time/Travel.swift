import Foundation

public final class Travel {
  static var traveledTo: Date?
  static var timeZone = TimeZone.current
  public static var now: Date {
    return traveledTo ?? Date()
  }
  public static var isTraveled: Bool {
    return traveledTo != nil
  }
  
  public static func travel(to: Date, in timeZone: TimeZone = TimeZone.current) {
    traveledTo = to
    self.timeZone = timeZone
  }
  
  public static func travelBack() {
    traveledTo = nil
  }
}
