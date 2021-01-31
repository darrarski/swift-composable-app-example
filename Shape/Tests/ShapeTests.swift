import ComposableArchitecture
import Testing
import XCTest
@testable import Shape

final class ShapeTests: XCTestCase {
  func testSlectShape() {
    let store = TestStore(
      initialState: ShapeState(type: .square),
      reducer: shapeReducer,
      environment: ()
    )

    store.assert(
      .send(.didSelectType(.circle)) {
        $0.type = .circle
      },
      .send(.didSelectType(.square)) {
        $0.type = .square
      },
      .send(.didSelectType(.circle)) {
        $0.type = .circle
      }
    )
  }

  func testApply() {
    let store = TestStore(
      initialState: ShapeState(type: .square),
      reducer: shapeReducer,
      environment: ()
    )

    store.assert(
      .send(.apply)
    )
  }

  func testPreviewSnapshot() {
    assertSnapshot(
      matching: ShapeView_Previews.previews,
      layout: .device(config: .iPhoneXr)
    )
  }

  func testSquareSnapshot() {
    assertSnapshot(
      matching: ShapeView(store: Store(
        initialState: ShapeState(type: .square),
        reducer: .empty,
        environment: ()
      )),
      layout: .device(config: .iPhoneXr)
    )
  }

  func testCircleSnapshot() {
    assertSnapshot(
      matching: ShapeView(store: Store(
        initialState: ShapeState(type: .circle),
        reducer: .empty,
        environment: ()
      )),
      layout: .device(config: .iPhoneXr)
    )
  }
}
