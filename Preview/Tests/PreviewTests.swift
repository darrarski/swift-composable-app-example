import Color
import ComposableArchitecture
import Shape
import XCTest
@testable import Preview

final class PreviewTests: XCTestCase {
  func testReset() {
    let store = TestStore(
      initialState: PreviewState(
        color: RGBColor(0, 0, 0),
        shape: .circle
      ),
      reducer: previewReducer,
      environment: ()
    )

    store.assert(
      .send(.reset) {
        $0.color = nil
        $0.shape = nil
      }
    )
  }
}
