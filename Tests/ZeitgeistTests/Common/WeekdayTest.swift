/**
 *  Zeitgeist
 *  Copyright (c) Florian Mielke 2024
 *  MIT license, see LICENSE file for details
 */

import XCTest
@testable import Zeitgeist

class WeekdayTest: XCTestCase {
  func testWeekdays() {
    let sorted = CalendarFixtures().tokyo.weekdays
    
    let expected = [
      Weekday(id: 1, symbol: "Sunday"),
      Weekday(id: 2, symbol: "Monday"),
      Weekday(id: 3, symbol: "Tuesday"),
      Weekday(id: 4, symbol: "Wednesday"),
      Weekday(id: 5, symbol: "Thursday"),
      Weekday(id: 6, symbol: "Friday"),
      Weekday(id: 7, symbol: "Saturday")
    ]
    XCTAssertEqual(expected, sorted)
  }
  
  func testMondayIsFirstWeekdayInGermany() {
    let sorted = CalendarFixtures().berlin.weekdays
    
    let expected = [
      Weekday(id: 2, symbol: "Montag"),
      Weekday(id: 3, symbol: "Dienstag"),
      Weekday(id: 4, symbol: "Mittwoch"),
      Weekday(id: 5, symbol: "Donnerstag"),
      Weekday(id: 6, symbol: "Freitag"),
      Weekday(id: 7, symbol: "Samstag"),
      Weekday(id: 1, symbol: "Sonntag")
    ]
    XCTAssertEqual(expected, sorted)
  }
  
  func testOverrideFirstWeekday() {
    var calendar = Calendar(identifier: .gregorian)
    calendar.firstWeekday = 3 /// Tuesday
    
    let sorted = calendar.weekdays
    
    let expected = [
      Weekday(id: 3, symbol: "Tue"),
      Weekday(id: 4, symbol: "Wed"),
      Weekday(id: 5, symbol: "Thu"),
      Weekday(id: 6, symbol: "Fri"),
      Weekday(id: 7, symbol: "Sat"),
      Weekday(id: 1, symbol: "Sun"),
      Weekday(id: 2, symbol: "Mon")
    ]
    XCTAssertEqual(expected, sorted)
  }
}

extension WeekdayTest {
  func testCodable() throws {
    let encodedMonday = try JSONEncoder().encode(Weekday.monday)
    let monday = try JSONDecoder().decode(Weekday.self, from: encodedMonday)
    XCTAssertEqual(Weekday.monday, monday)
  }
  
  func testCoding() throws {
    let archivedWednesday = try NSKeyedArchiver.archivedData(withRootObject: Weekday.wednesday, requiringSecureCoding: true)
    let wednesday = try NSKeyedUnarchiver.unarchivedObject(ofClass: Weekday.self, from: archivedWednesday)
    XCTAssertEqual(Weekday.wednesday, wednesday)
  }
  
  func testWeekdayArrayToString() {
    XCTAssertEqual("1234567", CalendarFixtures().tokyo.weekdays.toString)
  }
  
  func testWeekdayStringToArray() {
    let expected: [Weekday] = [.monday, .tuesday, .friday]
    
    XCTAssertEqual(expected, "236".toWeekdays)
  }
}
