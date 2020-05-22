/**
*  Zeitgeist
*  Copyright (c) Florian Mielke 2020
*  MIT license, see LICENSE file for details
*/

import Foundation

// MARK: - Enumerating

public extension Int {
    func times(_ f: () -> ()) {
        guard self > 0 else { return }
        for _ in 0..<self {
            f()
        }
    }
    
    func times(_ f: @autoclosure () -> ()) {
        guard self > 0 else { return }
        for _ in 0..<self {
            f()
        }
    }
}

// MARK: - Rounding

extension Int: Roundable {
    func rounded(by rounding: Rounding) -> Int {
        let interval = rounding.interval.rawValue
        switch rounding.method {
        case .nearest:
            return rounded(to: interval)
        case .up:
            return roundedUp(to: interval)
        case .down:
            return roundedDown(to: interval)
        }
    }
    
    func rounded(to roundTo: Int) -> Int {
        guard roundTo > 0 else {
            return self
        }
        let remainder = self % roundTo
        let roundUpThreshold = roundTo / 2
        if (remainder < roundUpThreshold) {
            return roundedDown(to: roundTo)
        } else {
            return roundedUp(to: roundTo)
        }
    }
    
    func roundedUp(to roundTo: Int) -> Int {
        guard roundTo > 0 else {
            return self
        }
        let remainder = self % roundTo
        if (remainder == 0) {
            return self
        }
        return self + roundTo - remainder
    }
    
    func roundedDown(to roundTo: Int) -> Int {
        guard roundTo > 0 else {
            return self
        }
        let remainder = self % roundTo
        return self - remainder
    }
}

// MARK: - Calculating

public extension Int {
    func inverted() -> Int {
        return self * (-1)
    }
}
