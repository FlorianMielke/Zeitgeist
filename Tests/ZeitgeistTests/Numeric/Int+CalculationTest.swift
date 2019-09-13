import XCTest
@testable import Zeitgeist

final class Int_CalculationTest : XCTestCase {
  func testItInverts() {
    XCTAssertEqual(0, 0.inverted())
    XCTAssertEqual(-1, 1.inverted())
    XCTAssertEqual(1, -1.inverted())
  }
  
  static var allTests = [
    ("testItInverts", testItInverts),
  ]
}
