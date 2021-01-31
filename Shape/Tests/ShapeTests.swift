import ComposableArchitecture
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
}
