/**
*  Zeitgeist
*  Copyright (c) Florian Mielke 2020
*  MIT license, see LICENSE file for details
*/

import Foundation

public final class Travel {
    public static var now: Date { traveledTo ?? Date() }
    public static var isTraveled: Bool { traveledTo != nil }
    
    static var traveledTo: Date?
    static var timeZone = TimeZone.current
    
    public static func travel(to: Date, in timeZone: TimeZone = TimeZone.current) {
        traveledTo = to
        self.timeZone = timeZone
    }
    
    public static func travelBack() {
        traveledTo = nil
    }
}
