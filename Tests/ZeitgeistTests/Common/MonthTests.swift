/**
 *  Zeitgeist
 *  Copyright (c) Florian Mielke 2024
 *  MIT license, see LICENSE file for details
 */

import XCTest
@testable import Zeitgeist

final class MonthTests: XCTestCase {
  func testComparable() {
    XCTAssertTrue(Month(2, year: 2023) > Month(1, year: 2023))
    XCTAssertTrue(Month(1, year: 2023) > Month(4, year: 2022))
    XCTAssertTrue(Month(1, year: 2023) == Month(1, year: 2023))
  }
}
