import SnapshotTesting
import SwiftUI
import UIKit

public var isRecording: Bool {
  get { SnapshotTesting.isRecording }
  set { SnapshotTesting.isRecording = newValue }
}

public func assertSnapshot<Value: SwiftUI.View>(
  matching value: Value,
  drawHierarchyInKeyWindow: Bool = false,
  precision: Float = 1,
  layout: SwiftUISnapshotLayout = .sizeThatFits,
  userInterfaceStyles: [UIUserInterfaceStyle] = [.light, .dark],
  named name: String? = nil,
  record recording: Bool = false,
  file: StaticString = #file,
  testName: String = #function,
  line: UInt = #line
) {
  userInterfaceStyles.forEach { userInterfaceStyle in
    SnapshotTesting.assertSnapshot(
      matching: value,
      as: .image(
        drawHierarchyInKeyWindow: drawHierarchyInKeyWindow,
        precision: precision,
        layout: layout,
        traits: .init(userInterfaceStyle: userInterfaceStyle)
      ),
      named: [name, userInterfaceStyle.name]
        .compactMap { $0 }
        .joined(separator: "-"),
      record: recording,
      file: file,
      testName: testName,
      line: line
    )
  }
}

private extension UIUserInterfaceStyle {
  var name: String {
    switch self {
    case .dark: return "dark"
    case .light: return "light"
    case .unspecified: fatalError()
    @unknown default: fatalError()
    }
  }
}
