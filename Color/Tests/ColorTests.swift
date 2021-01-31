import ComposableArchitecture
import XCTest
@testable import Color

final class ColorTests: XCTestCase {
  func testUpdateColor() {
    let store = TestStore(
      initialState: ColorState(red: 0, green: 0, blue: 0),
      reducer: colorReducer,
      environment: ()
    )

    store.assert(
      .send(.didUpdateRed(0.5)) {
        $0.red = 0.5
      },
      .send(.didUpdateGreen(0.5)) {
        $0.green = 0.5
      },
      .send(.didUpdateBlue(0.5)) {
        $0.blue = 0.5
      }
    )
  }

  func testUpdateColorWithOutOfBoundsValue() {
    let store = TestStore(
      initialState: ColorState(red: 0.5, green: 0.5, blue: 0.5),
      reducer: colorReducer,
      environment: ()
    )

    store.assert(
      .send(.didUpdateRed(-0.1)) {
        $0.red = 0
      },
      .send(.didUpdateGreen(-0.1)) {
        $0.green = 0
      },
      .send(.didUpdateBlue(-0.1)) {
        $0.blue = 0
      },
      .send(.didUpdateRed(1.1)) {
        $0.red = 1
      },
      .send(.didUpdateGreen(1.1)) {
        $0.green = 1
      },
      .send(.didUpdateBlue(1.1)) {
        $0.blue = 1
      }
    )
  }
}
