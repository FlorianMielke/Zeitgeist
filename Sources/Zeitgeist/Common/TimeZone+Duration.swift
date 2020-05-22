/**
*  Zeitgeist
*  Copyright (c) Florian Mielke 2020
*  MIT license, see LICENSE file for details
*/

import Foundation

extension TimeZone {
    public static func withDurationFromGMT(_ duration: Duration) -> TimeZone? {
        return TimeZone(secondsFromGMT: duration.second)
    }
}
