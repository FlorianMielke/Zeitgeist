/**
 *  Zeitgeist
 *  Copyright (c) Florian Mielke 2024
 *  MIT license, see LICENSE file for details
 */

import Foundation

public struct Month: Hashable, Equatable, Comparable, CustomDebugStringConvertible {
  public static let zero = Month(0, year: 0)

  public let month: Int
  public let year: Int
  
  public init(_ month: Int, year: Int) {
    self.month = month
    self.year = year
  }
  
  public static func < (lhs: Month, rhs: Month) -> Bool {
    if lhs.year == rhs.year {
      return lhs.month < rhs.month
    } else {
      return lhs.year < rhs.year
    }
  }
  
  public var debugDescription: String {
    return "\"\(month)\" \"\(year)\""
  }
}
