/**
 *  Zeitgeist
 *  Copyright (c) Florian Mielke 2023
 *  MIT license, see LICENSE file for details
 */

import Foundation

extension Int {
  var seconds: TimeInterval {
    TimeInterval(self)
  }
  
  var second: TimeInterval {
    seconds
  }
  
  var minutes: TimeInterval {
    self.seconds * 60
  }
  
  var minute: TimeInterval {
    minutes
  }
  
  var hours: TimeInterval {
    self.minutes * 60
  }
  
  var hour: TimeInterval {
    self.hours
  }

  var day: TimeInterval {
    self.hours * 24
  }
  
  var days: TimeInterval {
    self.day
  }
}
