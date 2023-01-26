/**
*  Zeitgeist
*  Copyright (c) Florian Mielke 2020
*  MIT license, see LICENSE file for details
*/

import XCTest
@testable import Zeitgeist

final class Time_ComponentTest : XCTestCase {
    func testComponents() {
        let time = Time(2018, 2, 1, 12, 4, 15)
        
        XCTAssertEqual(2018, time.year)
        XCTAssertEqual(2, time.month)
        XCTAssertEqual(1, time.day)
        XCTAssertEqual(12, time.hour)
        XCTAssertEqual(4, time.minute)
        XCTAssertEqual(15, time.second)
    }
    
    func testIsUTC() {
        XCTAssertTrue(Time(calendar: .utc).isUTC)
    }
    
    static var allTests = [
        ("testComponents", testComponents),
        ("testIsUTC", testIsUTC),
    ]
}
