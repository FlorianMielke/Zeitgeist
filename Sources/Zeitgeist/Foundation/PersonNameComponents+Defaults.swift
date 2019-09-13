import Foundation

extension PersonNameComponents {
  public static var nameless: PersonNameComponents {
    var comp = PersonNameComponents()
    comp.givenName = ""
    comp.familyName = ""
    return comp
  }
}
