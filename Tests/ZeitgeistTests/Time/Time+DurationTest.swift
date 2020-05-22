/**
*  Zeitgeist
*  Copyright (c) Florian Mielke 2020
*  MIT license, see LICENSE file for details
*/

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
        let subject = Time(2018, 1, 1, 1, 1, 0, calendar: Calendar.current(with: 2.hours)!)
        let other = Time(2018, 1, 1, 2, 1, 0, calendar: Calendar.current(with: 4.hours)!)
        
        let seconds = subject.duration(to: other)
        
        XCTAssertEqual((-1).hours, seconds)
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
