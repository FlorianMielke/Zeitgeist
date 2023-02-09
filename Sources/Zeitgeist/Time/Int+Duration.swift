import Foundation

public extension Int {
  var second: TimeInterval {
    TimeInterval(self)
  }
  
  var seconds: TimeInterval {
    second
  }
  
  var minute: TimeInterval {
    TimeInterval(self * 60)
  }
  
  var minutes: TimeInterval {
    minute
  }
  
  var hour: TimeInterval {
    TimeInterval(self * 60 * 60)
  }
  
  var hours: TimeInterval {
    hour
  }
  
  var day: TimeInterval {
    TimeInterval(self * 24 * 60 * 60)
  }
  
  var days: TimeInterval {
    day
  }
}
