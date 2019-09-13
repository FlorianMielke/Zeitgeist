import XCTest
@testable import Zeitgeist

final class NSPredicate_EmailTest: XCTestCase {
  func testItEvaluatesEmailAddresses() {
    let subject = NSPredicate.email
    XCTAssertTrue(subject.evaluate(with: "bob@example.com"))
  }
  
  static var allTests = [
    ("testItEvaluatesEmailAddresses", testItEvaluatesEmailAddresses),
  ]
}
