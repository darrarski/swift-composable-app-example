import XCTest
@testable import Common

final class IsRunningTestsTests: XCTestCase {
  func testShouldBeRunningTests() {
    XCTAssertTrue(isRunningTests)
  }
}
