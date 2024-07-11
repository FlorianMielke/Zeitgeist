/**
 *  Zeitgeist
 *  Copyright (c) Florian Mielke 2024
 *  MIT license, see LICENSE file for details
 */

import Foundation
@testable import Zeitgeist

class CalendarFixtures {
  var tokyo: Calendar {
    if let storedTokyo {
      return storedTokyo
    }
    var calendar = Calendar(identifier: .gregorian)
    calendar.timeZone = .tokyo
    storedTokyo = calendar
    return calendar
  }
  private var storedTokyo: Calendar?

  var berlin: Calendar {
    if let storedBerlin {
      return storedBerlin
    }
    var calendar = Calendar(identifier: .gregorian)
    calendar.timeZone = .berlin
    calendar.firstWeekday = Weekday.monday.id
    calendar.minimumDaysInFirstWeek = 2
    storedBerlin = calendar
    return calendar
  }
  private var storedBerlin: Calendar?
  
  var utc: Calendar {
    if let storedUTC {
      return storedUTC
    }
    let calendar = Calendar.utc
    storedUTC = calendar
    return calendar
  }
  private var storedUTC: Calendar?
}
