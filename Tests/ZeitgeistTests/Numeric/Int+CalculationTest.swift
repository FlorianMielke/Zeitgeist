/**
*  Zeitgeist
*  Copyright (c) Florian Mielke 2020
*  MIT license, see LICENSE file for details
*/

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
