/**
 *  Zeitgeist
 *  Copyright (c) Florian Mielke 2023
 *  MIT license, see LICENSE file for details
 */

import Foundation

public extension TimeInterval {
  var ago: TimeInterval {
    guard self > 0 else { return self }
    return self * -1
  }
}
