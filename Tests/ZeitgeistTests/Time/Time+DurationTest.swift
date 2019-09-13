import XCTest
@testable import Zeitgeist

final class Time_DurationTest : XCTestCase {  
  func testDurationToOtherTime() {
    let subject = Time(2018, 1, 1, 1, 1, 0)
    let other = Time(2018, 1, 1, 1, 5, 0)
    
    let seconds = subject.duration(to: other)
    
    XCTAssertEqual(240.seconds, seconds)
  }
  
  func testDurationWithTimesInDifferentTimeZones() {
    var otherCalendar = Calendar.current
    otherCalendar.timeZone = TimeZone(secondsFromGMT: 2.hours.second)!
    let other = Time(2018, 1, 1, 2, 5, 0, calendar: otherCalendar)
    let subject = Time(2018, 1, 1, 1, 1, 0)

    let seconds = subject.duration(to: other)
    
    XCTAssertEqual(4.minutes, seconds)
  }
  
  func testAddition() {
    let subject = Time(2018, 1, 1, 1)
    XCTAssertEqual(Time(2018, 1, 1, 1, 5), subject + 5.minutes)
    XCTAssertEqual(Time(2018, 1, 1, 1), subject + 0.minutes)
  }
  
  static var allTests = [
    ("testDurationToOtherTime", testDurationToOtherTime),
    ("testDurationWithTimesInDifferentTimeZones", testDurationWithTimesInDifferentTimeZones),
    ("testAddition", testAddition),
  ]
}
