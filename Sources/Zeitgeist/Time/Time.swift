/**
 *  Zeitgeist
 *  Copyright (c) Florian Mielke 2020
 *  MIT license, see LICENSE file for details
 */

import Foundation

public struct Time: Equatable, Hashable, Comparable {
  public static var current: Time { Time() }
  
  public let calendar: Calendar
  public let date: Date
  public var timeZone: TimeZone { calendar.timeZone }
  
  public static func current(calendar: Calendar) -> Time {
    return Time(calendar: calendar)
  }
  
  public static func currentTime(at date: Time, calendar: Calendar = .current) -> Time {
    let current = Time.current(calendar: calendar)
    return Time(date.year, date.month, date.day, current.hour, current.minute, current.second, calendar: calendar)
  }
  
  public init(at date: Date = Travel.now, calendar: Calendar = .current) {
    self.date = date
    self.calendar = calendar
  }
  
  public init(calendar: Calendar) {
    self.init(at: Travel.now, calendar: calendar)
  }
  
  public init(_ year: Int, _ month: Int, _ day: Int, _ hour: Int = 0, _ minute: Int = 0, _ second: Int = 0, calendar: Calendar = .current) {
    let component = DateComponents(year: year, month: month, day: day, hour: hour, minute: minute, second: second)
    let date = calendar.date(from: component)!
    self.init(at: date, calendar: calendar)
  }
  
  public init(components: DateComponents, calendar: Calendar = .current) {
    let date = calendar.date(from: components)!
    self.init(at: date, calendar: calendar)
  }
}

// MARK: - Comparison

public extension Time {
  func isOnSameDay(_ other: Time) -> Bool {
    return calendar.isDate(self.date, inSameDayAs: other.date)
  }
  
  static func <(lhs: Time, rhs: Time) -> Bool {
    return lhs.date < rhs.date
  }
}

// MARK: - Components

public extension Time {
  var year: Int {
    return component(.year)
  }
  
  var month: Int {
    return component(.month)
  }
  
  var day: Int {
    return component(.day)
  }
  
  var hour: Int {
    return component(.hour)
  }
  
  var minute: Int {
    return component(.minute)
  }
  
  var second: Int {
    return component(.second)
  }
  
  func component(_ component: Calendar.Component) -> Int {
    return calendar.component(component, from: date)
  }
  
  var isUTC: Bool {
    return timeZone == .utc
  }
}

// MARK: - Rounding

extension Time {
  public func rounded(by rounding: Rounding) -> Time {
    let interval = rounding.interval.rawValue
    switch rounding.method {
    case .nearest:
      return rounded(self, to: minute.rounded(to: interval))
    case .up:
      return rounded(self, to: minute.roundedUp(to: interval))
    case .down:
      return rounded(self, to: minute.roundedDown(to: interval))
    }
  }
  
  private func rounded(_: Time, to roundedMinutes: Int) -> Time {
    return Time(year, month, day, hour, roundedMinutes, 0, calendar: calendar)
  }
}

// MARK: - Manipulation

extension Time {
  public func trimmed(to component: Calendar.Component) -> Time {
    switch component {
    case .day: return Time(year, month, day, calendar: calendar)
    case .second: return Time(year, month, day, hour, minute, 0, calendar: calendar)
    default:
      return self
    }
  }
  
  public func components(_ components: Set<Calendar.Component>) -> DateComponents {
    return calendar.dateComponents(components, from: date)
  }
  
  public var starts: Time {
    return Time(at: calendar.startOfDay(for: date), calendar: calendar)
  }
  
  public var ends: Time {
    var comp = DateComponents()
    comp.day = 1
    comp.second = -1
    let ends = calendar.date(byAdding: comp, to: starts.date)!
    return Time(at: ends, calendar: calendar)
  }
}
