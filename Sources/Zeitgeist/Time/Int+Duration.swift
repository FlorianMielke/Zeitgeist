public extension Int {
  var second: Int {
    self
  }
  
  var seconds: Int {
    second
  }
  
  var minute: Int {
    self * 60.seconds
  }
  
  var minutes: Int {
    minute
  }
  
  var hour: Int {
    self * 60.minutes
  }
  
  var hours: Int {
    hour
  }
  
  var day: Int {
    self * 24.hours
  }
  
  var days: Int {
    day
  }
}
