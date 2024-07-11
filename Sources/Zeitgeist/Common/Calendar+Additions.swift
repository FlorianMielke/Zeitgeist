/**
 *  Zeitgeist
 *  Copyright (c) Florian Mielke 2024
 *  MIT license, see LICENSE file for details
 */

import Foundation

extension Calendar {
  public func noon(for date: Date = .now, in timeZone: TimeZone? = nil) -> Date {
    let tz = timeZone ?? self.timeZone
    let components = dateComponents(in: tz, from: date)
    var noonComponents = DateComponents()
    noonComponents.year = components.year
    noonComponents.month = components.month
    noonComponents.day = components.day
    noonComponents.hour = 12
    noonComponents.minute = 0
    noonComponents.second = 0
    return self.date(from: noonComponents)!
  }
  
  public func endOfDay(for date: Date) -> Date? {
    let startOfDay = startOfDay(for: date)
    return self.date(byAdding: DateComponents(day: 1, second: -1), to: startOfDay)
  }
  
  public func date(year: Int? = nil, month: Int? = nil, day: Int? = nil, hour: Int? = nil, minute: Int? = nil, second: Int? = nil) -> Date? {
    date(from: .init(year: year, month: month, day: day, hour: hour, minute: minute, second: second))
  }
  
  public func dateComponents(from date: Date) -> DateComponents {
    dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
  }
  
  public func seconds(from: Date, to: Date) -> Int? {
    dateComponents([.second], from: from, to: to).second
  }

  public var yesterday: Date {
    return date(byAdding: .day, value: -1, to: .now)!
  }
  
  public var tomorrow: Date {
    return date(byAdding: .day, value: 1, to: .now)!
  }
  
  public func dateIsInFuture(_ date: Date, granularity: Calendar.Component = .second) -> Bool {
    return compare(date, to: Date(), toGranularity: granularity) == .orderedDescending
  }
  
  public func hasDate(_ date1: Date, theSameTimeThan date2: Date) -> Bool {
    let components1 = dateComponents([.hour, .minute, .second], from: date1)
    let components2 = dateComponents([.hour, .minute, .second], from: date2)
    
    let sameHour = components1.hour != nil && components1.hour == components2.hour
    let sameMinute = components1.minute != nil && components1.minute == components2.minute
    let sameSecond = components1.second != nil && components1.second == components2.second
    return sameHour && sameMinute && sameSecond
  }
}

// MARK: - Rounding
extension Calendar {
  public func date(byTrimming component: Calendar.Component, of date : Date) -> Date? {
    var components = dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
    switch component {
    case .minute:
      components.minute = 0
      components.second = 0
    case .second:
      components.second = 0
    default:
      return date
    }
    return self.date(from: components)
  }
  
  public func date(byRoundingMinutes rounding: Rounding, date: Date) -> Date? {
    let components = dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
    guard let hour = components.hour else { return nil }
    guard let minute = components.minute else { return nil }
    
    let roundedMinutes = {
      let interval = rounding.interval.rawValue
      switch rounding.method {
      case .nearest:
        return minute.rounded(to: interval)
      case .up:
        return minute.roundedUp(to: interval)
      case .down:
        return minute.roundedDown(to: interval)
      }
    }()
    
    return self.date(bySettingHour: hour, minute: roundedMinutes, second: 0, of: date)
  }
}

// MARK: - Year
extension Calendar {
  public func startOfYear(for date: Date) -> Date? {
    var components = dateComponents([.year, .month, .day], from: date)
    components.month = 1
    components.day = 1
    guard let date = self.date(from: components) else { return nil }
    return startOfDay(for: date)
  }
}

// MARK: - Month
extension Calendar {
  public func dateInterval(for month: Month) -> DateInterval? {
    let components = DateComponents(year: month.year, month: month.month)
    guard let startDate = date(from: components) else { return nil }
    let start = startOfDay(for: startDate)
    guard 
      let endDate = date(byAdding: .init(month: 1, day: -1), to: start),
      let end = endOfDay(for: endDate)
    else { return nil }
    
    return DateInterval(start: start, end: end)
  }
  
  public func isCurrent(_ month: Month) -> Bool {
    currentMonth == month
  }
  
  public var currentMonth: Month? {
    let components = dateComponents([.year, .month], from: .now)
    guard let month = components.month, let year = components.year else { return nil }
    return Month(month, year: year)
  }
}

// MARK: - Week
extension Calendar {
  public func weekdayID(for date: Date) -> Int? {
    let components = dateComponents([.weekday], from: date)
    return components.weekday
  }
  
  public func isCurrent(_ week: Week) -> Bool {
    currentWeek == week
  }
  
  public var currentWeek: Week? {
    let components = dateComponents([.weekOfYear, .yearForWeekOfYear], from: .now)
    guard let weekOfYear = components.weekOfYear, let yearForWeekOfYear = components.yearForWeekOfYear else { return nil }
    return Week(weekOfYear, year: yearForWeekOfYear)
  }
  
  public func dateInterval(for week: Week) -> DateInterval? {
    let components = DateComponents(weekOfYear: week.weekOfYear, yearForWeekOfYear: week.yearForWeekOfYear)
    guard let startDate = date(from: components) else { return nil }
    let start = startOfDay(for: startDate)
    guard
      let endDate = date(byAdding: .day, value: 6, to: start),
      let end = endOfDay(for: endDate)
    else {
      return nil
    }
    
    return DateInterval(start: start, end: end)
  }
  
  public func dateForNextWeek(for date: Date) -> Date? {
    self.date(byAdding: .weekOfYear, value: 1, to: date)
  }
}

extension NSCalendar {
  @objc public func hasDate(_ date1: Date, theSameTimeThan date2: Date) -> Bool {
    (self as Calendar).hasDate(date1, theSameTimeThan: date2)
  }
}
