public extension Int {
  var seconds: Duration { Duration(Duration.Defaults.second.rawValue * self) }
  var second: Duration { self.seconds }
  
  var minutes: Duration { Duration(Duration.Defaults.minute.rawValue * self) }
  var minute: Duration { self.minutes }
  
  var hours: Duration { Duration(Duration.Defaults.hour.rawValue * self) }
  var hour: Duration { self.hours }
  
  var days: Duration { Duration(Duration.Defaults.day.rawValue * self) }
  var day: Duration { self.days }
}
