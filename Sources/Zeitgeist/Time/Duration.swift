/**
*  Zeitgeist
*  Copyright (c) Florian Mielke 2020
*  MIT license, see LICENSE file for details
*/

import Foundation

public struct Duration: Equatable, Hashable {
    public var second: Int = 0
    
    public var components: DateComponents {
        var components = DateComponents()
        components.second = second
        return components
    }
    
    public var inverted: Duration {
        return Duration(second.negated())
    }
    
    public init(_ second: Int = 0) {
        self.second = second
    }
    
    public func ago(time: Time = Time.current) -> Time {
        let date = time.calendar.date(byAdding: self.inverted.components, to: time.date)!
        return Time(at: date)
    }
    
    public enum Defaults: Int {
        case second = 1
        case minute = 60
        case hour = 3600
        case day = 86400
    }
}

// MARK: - Math

extension Duration {
    public static func +(lhs: Duration, rhs: Duration) -> Duration {
        return Duration(lhs.second + rhs.second)
    }
    
    public static func -(lhs: Duration, rhs: Duration) -> Duration {
        return Duration(lhs.second - rhs.second)
    }
}

extension Duration: Comparable {
    public static func <(lhs: Duration, rhs: Duration) -> Bool {
        return lhs.second < rhs.second
    }
}
