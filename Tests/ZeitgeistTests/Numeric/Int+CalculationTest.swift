/**
 *  Zeitgeist
 *  Copyright (c) Florian Mielke 2020
 *  MIT license, see LICENSE file for details
 */

import XCTest
@testable import Zeitgeist

final class Int_CalculationTest : XCTestCase {
  func testItNegates() {
    XCTAssertEqual(0, 0.negated())
    XCTAssertEqual(-1, 1.negated())
    XCTAssertEqual(1, -1.negated())
  }
  
  static var allTests = [
    ("testItNegates", testItNegates),
  ]
}
