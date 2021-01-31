import ComposableArchitecture
import XCTest
@testable import Color

final class ColorTests: XCTestCase {
  func testUpdateColor() {
    let store = TestStore(
      initialState: ColorState(rgb: RGBColor(0, 0, 0)),
      reducer: colorReducer,
      environment: ()
    )

    store.assert(
      .send(.didUpdateRed(0.5)) {
        $0.rgb.red = 0.5
      },
      .send(.didUpdateGreen(0.5)) {
        $0.rgb.green = 0.5
      },
      .send(.didUpdateBlue(0.5)) {
        $0.rgb.blue = 0.5
      }
    )
  }

  func testUpdateColorWithOutOfBoundsValue() {
    let store = TestStore(
      initialState: ColorState(rgb: RGBColor(0.5, 0.5, 0.5)),
      reducer: colorReducer,
      environment: ()
    )

    store.assert(
      .send(.didUpdateRed(-0.1)) {
        $0.rgb.red = 0
      },
      .send(.didUpdateGreen(-0.1)) {
        $0.rgb.green = 0
      },
      .send(.didUpdateBlue(-0.1)) {
        $0.rgb.blue = 0
      },
      .send(.didUpdateRed(1.1)) {
        $0.rgb.red = 1
      },
      .send(.didUpdateGreen(1.1)) {
        $0.rgb.green = 1
      },
      .send(.didUpdateBlue(1.1)) {
        $0.rgb.blue = 1
      }
    )
  }
}
