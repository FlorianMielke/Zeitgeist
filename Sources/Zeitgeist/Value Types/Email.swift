import Foundation

public struct Email: Equatable {
  public let value: String
  
  public init(value: String = "") {
    self.value = value
  }
  
  public func isValid() -> Bool {
    return NSPredicate.email.evaluate(with: value)
  }
}
