import Foundation

public var isRunningTests: Bool {
  NSClassFromString("XCTestCase") != nil
}
