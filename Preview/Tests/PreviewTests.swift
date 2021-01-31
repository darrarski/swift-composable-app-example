import Color
import ComposableArchitecture
import Shape
import Testing
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

  func testPreviewSnapshot() {
    assertSnapshot(
      matching: PreviewView_Previews.previews,
      layout: .device(config: .iPhoneXr)
    )
  }

  func testEmptySnapshot() {
    assertSnapshot(
      matching: PreviewView(store: Store(
        initialState: PreviewState(),
        reducer: .empty,
        environment: ()
      )),
      layout: .device(config: .iPhoneXr)
    )
  }

  func testCircleSnapshot() {
    assertSnapshot(
      matching: PreviewView(store: Store(
        initialState: PreviewState(
          color: RGBColor(0.25, 0.5, 0.33),
          shape: .circle
        ),
        reducer: .empty,
        environment: ()
      )),
      layout: .device(config: .iPhoneXr)
    )
  }

  func testSquareSnapshot() {
    assertSnapshot(
      matching: PreviewView(store: Store(
        initialState: PreviewState(
          color: RGBColor(0.75, 0.5, 0.25),
          shape: .square
        ),
        reducer: .empty,
        environment: ()
      )),
      layout: .device(config: .iPhoneXr)
    )
  }
}
