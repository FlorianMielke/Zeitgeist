/**
*  Zeitgeist
*  Copyright (c) Florian Mielke 2020
*  MIT license, see LICENSE file for details
*/

import Foundation

extension Calendar {
    public static func current(with timeZone: TimeZone) -> Calendar {
        var calendar = Calendar.current
        calendar.timeZone = timeZone
        return calendar
    }
}
