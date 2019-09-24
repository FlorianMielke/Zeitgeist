import Foundation

extension String: Localizable {
  var localized: String { NSLocalizedString(self, tableName: "ZeitgeistLocalizable", bundle: Zeitgeist.bundle, value: "", comment: "") }
}
