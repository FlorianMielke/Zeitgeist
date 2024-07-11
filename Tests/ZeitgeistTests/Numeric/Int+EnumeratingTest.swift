/**
 *  Zeitgeist
 *  Copyright (c) Florian Mielke 2020
 *  MIT license, see LICENSE file for details
 */

import XCTest
@testable import Zeitgeist

final class Int_EnumeratingTest : XCTestCase {
  func testItCallsAClosure0Times() {
    var result = "a"
    
    0.times {
      result.append("b")
    }
    
    XCTAssertEqual("a", result)
  }
  
  func testItCallsAClosure1Time() {
    var result = "a"
    
    1.times {
      result.append("b")
    }
    
    XCTAssertEqual("ab", result)
  }
  
  func testItCallsAClosure5Times() {
    var result = "a"
    
    5.times {
      result.append("b")
    }
    
    XCTAssertEqual("abbbbb", result)
  }
}
