import XCTest
@testable import Zeitgeist

final class Time_ManipulationTest : XCTestCase {
  func testTrim() {
    XCTAssertEqual(Time(2018, 7, 14, 15, 8, 0), Time(2018, 7, 14, 15, 8, 3).trimmed(to: .second))
    XCTAssertEqual(Time(2018, 7, 14), Time(2018, 7, 14, 15, 8, 3).trimmed(to: .day))
  }
  
  func testEnds() {
    XCTAssertEqual(Time(2018, 5, 3, 23, 59, 59), Time(2018, 5, 3, 12).ends)
  }
  
  static var allTests = [
    ("testTrim", testTrim),
    ("testEnds", testEnds),
  ]
}
