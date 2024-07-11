/**
 *  Zeitgeist
 *  Copyright (c) Florian Mielke 2024
 *  MIT license, see LICENSE file for details
 */

import Foundation

public struct Week: Hashable, Equatable, Comparable, CustomDebugStringConvertible {
  public static let zero = Week(0, year: 0)
  
  public let weekOfYear: Int
  public let yearForWeekOfYear: Int
  
  public init(_ weekOfYear: Int, year yearForWeekOfYear: Int) {
    self.weekOfYear = weekOfYear
    self.yearForWeekOfYear = yearForWeekOfYear
  }
  
  public static func < (lhs: Week, rhs: Week) -> Bool {
    if lhs.yearForWeekOfYear == rhs.yearForWeekOfYear {
      return lhs.weekOfYear < rhs.weekOfYear
    } else {
      return lhs.yearForWeekOfYear < rhs.yearForWeekOfYear
    }
  }
  
  public var debugDescription: String {
    return "\"\(weekOfYear)\" \"\(yearForWeekOfYear)\""
  }
}
