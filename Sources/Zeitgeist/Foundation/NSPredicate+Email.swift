import Foundation

public extension NSPredicate {
  static var email: NSPredicate {
    let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    return NSPredicate(format:"SELF MATCHES %@", emailFormat)
  }
}
