import Foundation

extension String: Localizable {
  var localized: String {
    return NSLocalizedString(self, tableName: "ZeitgeistLocalizable", bundle: Zeitgeist.bundle, value: "", comment: "")
  }
}
