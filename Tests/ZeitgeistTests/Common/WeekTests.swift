/**
 *  Zeitgeist
 *  Copyright (c) Florian Mielke 2024
 *  MIT license, see LICENSE file for details
 */

import XCTest
@testable import Zeitgeist

final class WeekTests: XCTestCase {
  func testComparable() {
    XCTAssertTrue(Week(2, year: 2023) > Week(1, year: 2023))
    XCTAssertTrue(Week(1, year: 2023) > Week(4, year: 2022))
    XCTAssertTrue(Week(1, year: 2023) == Week(1, year: 2023))
  }
}
