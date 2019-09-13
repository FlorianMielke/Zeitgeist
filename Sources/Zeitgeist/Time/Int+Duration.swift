public extension Int {
  var seconds: Duration {
    return Duration(Duration.Defaults.second.rawValue * self)
  }
  
  var second: Duration {
    return self.seconds
  }
  
  var minutes: Duration {
    return Duration(Duration.Defaults.minute.rawValue * self)
  }
  
  var minute: Duration {
    return self.minutes
  }
  
  var hours: Duration {
    return Duration(Duration.Defaults.hour.rawValue * self)
  }
  
  var hour: Duration {
    return self.hours
  }
  
  var days: Duration {
    return Duration(Duration.Defaults.day.rawValue * self)
  }
  
  var day: Duration {
    return self.days
  }
}
