import XCTest
@testable import Zeitgeist

final class DurationTest: XCTestCase {
  var subject = Duration()
  
  override func setUp() {
    super.setUp()
    subject = Duration()
  }
  
  override func tearDown() {
    Travel.travelBack()
    super.tearDown()
  }
  
  func testCurrentAgo() {
    let referenceDate = Date.init(timeIntervalSinceReferenceDate: 5)
    Travel.travel(to: referenceDate)
    
    let time = subject.ago()
    
    XCTAssertEqual(Time(at: referenceDate), time)
  }
  
  func test1DayAgo() {
    let referenceDate = Date.init(timeIntervalSinceReferenceDate: 5)
    Travel.travel(to: referenceDate)
    
    let time = 1.day.ago()
    
    let expected = Calendar.current.date(byAdding: .day, value: -1, to: referenceDate)!
    XCTAssertEqual(Time(at: expected), time)
  }
  
  func test2HoursAgo() {
    let referenceDate = Date.init(timeIntervalSinceReferenceDate: 5)
    Travel.travel(to: referenceDate)
    
    let time = 2.hours.ago()
    
    let expected = Calendar.current.date(byAdding: .hour, value: -2, to: referenceDate)!
    XCTAssertEqual(Time(at: expected), time)
  }
  
  func testComparabale() {
    XCTAssertTrue(Duration(1) < Duration(2))
    XCTAssertTrue(Duration(5) < Duration(8))
  }
  
  func testAddition() {
    XCTAssertEqual(Duration(4), Duration(1) + Duration(3))
    XCTAssertEqual(Duration(-7), Duration(-3) + Duration(-4))
    XCTAssertEqual(Duration(-3), Duration(0) + Duration(-3))
  }

  func testSubstraction() {
    XCTAssertEqual(Duration(-2), Duration(1) - Duration(3))
    XCTAssertEqual(Duration(1), Duration(-3) - Duration(-4))
    XCTAssertEqual(Duration(13), Duration(14) - Duration(1))
  }
  
  static var allTests = [
    ("testCurrentAgo", testCurrentAgo),
    ("test1DayAgo", test1DayAgo),
    ("test2HoursAgo", test2HoursAgo),
    ("testComparabale", testComparabale),
    ("testAddition", testAddition),
    ("testSubstraction", testSubstraction),
  ]
}
