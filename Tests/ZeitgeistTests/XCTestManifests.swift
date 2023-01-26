/**
 *  Zeitgeist
 *  Copyright (c) Florian Mielke 2020
 *  MIT license, see LICENSE file for details
 */

import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
  return [
    testCase(ZeitgeistTests.allTests),
  ]
}
#endif
