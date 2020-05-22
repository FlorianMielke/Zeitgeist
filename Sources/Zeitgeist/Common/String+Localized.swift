/**
*  Zeitgeist
*  Copyright (c) Florian Mielke 2020
*  MIT license, see LICENSE file for details
*/

import Foundation

extension String {
    var localized: String { NSLocalizedString(self, tableName: "ZeitgeistLocalizable", bundle: Zeitgeist.bundle, value: "", comment: "") }
}
