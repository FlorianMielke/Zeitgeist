import Foundation

protocol Roundable {
  func rounded(by rounding: Rounding) -> Self
}

public enum RoundingMethod: Int, Equatable, Hashable, CaseIterable, CustomStringConvertible {
  case nearest
  case up
  case down
  
  public var description: String {
    switch self {
    case .nearest: return "nearest"
    case .up: return "up"
    case .down: return "down"
    }
  }
  
  public var localized: String { "rounding.method.\(description)".localized }
}

public enum RoundingInterval: Int, Equatable, Hashable, CaseIterable {
  case one = 1
  case two = 2
  case three = 3
  case four = 4
  case five = 5
  case six = 6
  case ten = 10
  case twelve = 12
  case fifteen = 15
  case twenty = 20
  case thirty = 30
}

public struct Rounding: Equatable, Hashable {
  public var interval = RoundingInterval.one
  public var method = RoundingMethod.nearest
  
  public init() {
    self.init(to: .one, method: .nearest)
  }

  public init(to interval: RoundingInterval, method: RoundingMethod) {
    self.interval = interval
    self.method = method
  }
}
