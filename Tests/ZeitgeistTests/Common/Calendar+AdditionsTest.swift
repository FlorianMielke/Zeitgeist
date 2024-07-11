/**
 *  Zeitgeist
 *  Copyright (c) Florian Mielke 2024
 *  MIT license, see LICENSE file for details
 */

import XCTest
@testable import Zeitgeist

class Calendar_AdditionsTest: XCTestCase {
  var utc: Calendar!
  
  override func setUp() {
    utc = Calendar.utc
  }
  
  func testNoon() {
    let date = Date(timeIntervalSinceReferenceDate: 120.seconds)
    
    let noon = utc.noon(for: date)
    
    let expected = utc.dateComponents([.year, .month, .day, .hour, .minute, .second], from: noon)
    XCTAssertEqual(2001, expected.year)
    XCTAssertEqual(1, expected.month)
    XCTAssertEqual(1, expected.day)
    XCTAssertEqual(12, expected.hour)
    XCTAssertEqual(0, expected.minute)
    XCTAssertEqual(0, expected.second)
  }
  
  func testGenerateAWeekAheadDate() throws {
    let date = try XCTUnwrap(utc.date(year: 2022, month: 3, day: 30))
    let components = utc.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
    
    let nextWeek = utc.dateForNextWeek(for: date)!
    
    let expected = utc.dateComponents([.year, .month, .day, .hour, .minute, .second], from: nextWeek)
    XCTAssertEqual(components.year, expected.year)
    XCTAssertEqual(4, expected.month)
    XCTAssertEqual(6, expected.day)
    XCTAssertEqual(components.hour, expected.hour)
    XCTAssertEqual(components.minute, expected.minute)
    XCTAssertEqual(components.second, expected.second)
  }
  
  func testFirstDayOfYear() throws {
    let date = try XCTUnwrap(utc.date(year: 2023, month: 4, day: 12, hour: 15, minute: 34, second: 21))
    let firstDay = utc.startOfYear(for: date)
    
    let expected = utc.date(from: DateComponents(year: 2023, month: 1, day: 1))
    XCTAssertEqual(firstDay, expected)
  }
  
  // MARK: - Rounding
  func testRound() throws {
    let date = try XCTUnwrap(utc.date(year: 2015, month: 5, day: 24, hour: 15, minute: 34, second: 21))
    let round = Rounding(to: .five, method: .nearest)
    
    let rounded = try XCTUnwrap(utc.date(byRoundingMinutes: round, date: date))
    
    let components = utc.dateComponents([.year, .month, .day, .hour, .minute, .second], from: rounded)
    XCTAssertEqual(2015, components.year)
    XCTAssertEqual(5, components.month)
    XCTAssertEqual(24, components.day)
    XCTAssertEqual(15, components.hour)
    XCTAssertEqual(35, components.minute)
    XCTAssertEqual(0, components.second)
  }
  
  func testRoundUp() throws {
    let date = try XCTUnwrap(utc.date(year: 2020, month: 10, day: 29, hour: 15, minute: 11, second: 21))
    let round = Rounding(to: .five, method: .up)
    
    let rounded = try XCTUnwrap(utc.date(byRoundingMinutes: round, date: date))
    
    let components = utc.dateComponents([.year, .month, .day, .hour, .minute, .second], from: rounded)
    XCTAssertEqual(2020, components.year)
    XCTAssertEqual(10, components.month)
    XCTAssertEqual(29, components.day)
    XCTAssertEqual(15, components.hour)
    XCTAssertEqual(15, components.minute)
    XCTAssertEqual(0, components.second)
  }
  
  func testRoundDown() throws {
    let date = try XCTUnwrap(utc.date(year: 2020, month: 10, day: 29, hour: 15, minute: 16, second: 21))
    let round = Rounding(to: .ten, method: .down)
    
    let rounded = try XCTUnwrap(utc.date(byRoundingMinutes: round, date: date))
    
    let components = utc.dateComponents([.year, .month, .day, .hour, .minute, .second], from: rounded)
    XCTAssertEqual(2020, components.year)
    XCTAssertEqual(10, components.month)
    XCTAssertEqual(29, components.day)
    XCTAssertEqual(15, components.hour)
    XCTAssertEqual(10, components.minute)
    XCTAssertEqual(0, components.second)
  }
  
  // MARK: - Date Interval for Month
  func testDateIntervalFor30DayMonth() throws {
    let month = Month(4, year: 2023)
    
    let interval = try XCTUnwrap(utc.dateInterval(for: month))
    
    let start = try XCTUnwrap(utc.date(year: 2023, month: 4, day: 1))
    let end = try XCTUnwrap(utc.date(year: 2023, month: 4, day: 30, hour: 23, minute: 59, second: 59))
    XCTAssertEqual(start, interval.start)
    XCTAssertEqual(end, interval.end)
  }

  func testDateIntervalFor31DayMonth() throws {
    let month = Month(5, year: 2020)
    
    let interval = try XCTUnwrap(utc.dateInterval(for: month))
    
    let start = try XCTUnwrap(utc.date(year: 2020, month: 5, day: 1))
    let end = try XCTUnwrap(utc.date(year: 2020, month: 5, day: 31, hour: 23, minute: 59, second: 59))
    XCTAssertEqual(start, interval.start)
    XCTAssertEqual(end, interval.end)
  }

  func testDateIntervalForFebruary() throws {
    let month = Month(2, year: 2023)
    
    let interval = try XCTUnwrap(utc.dateInterval(for: month))
    
    let start = try XCTUnwrap(utc.date(year: 2023, month: 2, day: 1, hour: 0, minute: 0, second: 0))
    let end = try XCTUnwrap(utc.date(year: 2023, month: 2, day: 28, hour: 23, minute: 59, second: 59))
    XCTAssertEqual(start, interval.start)
    XCTAssertEqual(end, interval.end)
  }
  
  // MARK: - Date Interval for Week
  func testDateIntervalForWeek() throws {
    let week = Week(4, year: 2023)
    let berlin = CalendarFixtures().berlin
    
    let interval = try XCTUnwrap(berlin.dateInterval(for: week))
    
    let start = try XCTUnwrap(berlin.date(year: 2023, month: 1, day: 23, hour: 0, minute: 0, second: 0))
    let end = try XCTUnwrap(berlin.date(year: 2023, month: 1, day: 29, hour: 23, minute: 59, second: 59))
    XCTAssertEqual(start, interval.start)
    XCTAssertEqual(end, interval.end)
  }
}
