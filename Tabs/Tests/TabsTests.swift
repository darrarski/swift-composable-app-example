import Color
import ComposableArchitecture
import Preview
import Shape
import Testing
import XCTest
@testable import Tabs

final class TabsTests: XCTestCase {
  func testSelectTab() {
    let store = TestStore(
      initialState: TabsState(
        selectedTab: .preview,
        color: ColorState(rgb: RGBColor(0, 0, 0)),
        shape: ShapeState(type: .circle),
        preview: PreviewState()
      ),
      reducer: tabsReducer,
      environment: ()
    )

    store.assert(
      .send(.didSelectTab(.color)) {
        $0.selectedTab = .color
      },
      .send(.didSelectTab(.shape)) {
        $0.selectedTab = .shape
      },
      .send(.didSelectTab(.preview)) {
        $0.selectedTab = .preview
      }
    )
  }

  func testApplyColor() {
    let store = TestStore(
      initialState: TabsState(
        selectedTab: .color,
        color: ColorState(rgb: RGBColor(0.5, 0.5, 0.5)),
        shape: ShapeState(type: .circle),
        preview: PreviewState()
      ),
      reducer: tabsReducer,
      environment: ()
    )

    store.assert(
      .send(.color(.apply)) {
        $0.preview.color = RGBColor(0.5, 0.5, 0.5)
      }
    )
  }

  func testApplyShape() {
    let store = TestStore(
      initialState: TabsState(
        selectedTab: .color,
        color: ColorState(rgb: RGBColor(0, 0, 0)),
        shape: ShapeState(type: .square),
        preview: PreviewState()
      ),
      reducer: tabsReducer,
      environment: ()
    )

    store.assert(
      .send(.shape(.apply)) {
        $0.preview.shape = .square
      }
    )
  }

  func testPreviewSnapshot() {
    assertSnapshot(
      matching: TabsView_Previews.previews,
      layout: .device(config: .iPhoneXr)
    )
  }

  func testColorTabSnapshot() {
    assertSnapshot(
      matching: TabsView(store: Store(
        initialState: TabsState(
          selectedTab: .color,
          color: ColorState(rgb: RGBColor(0.5, 0.5, 0.5)),
          shape: ShapeState(type: .circle),
          preview: PreviewState()
        ),
        reducer: .empty,
        environment: ()
      )),
      layout: .device(config: .iPhoneXr)
    )
  }

  func testShapeTabSnapshot() {
    assertSnapshot(
      matching: TabsView(store: Store(
        initialState: TabsState(
          selectedTab: .shape,
          color: ColorState(rgb: RGBColor(0.5, 0.5, 0.5)),
          shape: ShapeState(type: .circle),
          preview: PreviewState()
        ),
        reducer: .empty,
        environment: ()
      )),
      layout: .device(config: .iPhoneXr)
    )
  }

  func testPreviewTabSnapshot() {
    assertSnapshot(
      matching: TabsView(store: Store(
        initialState: TabsState(
          selectedTab: .preview,
          color: ColorState(rgb: RGBColor(0.5, 0.5, 0.5)),
          shape: ShapeState(type: .circle),
          preview: PreviewState()
        ),
        reducer: .empty,
        environment: ()
      )),
      layout: .device(config: .iPhoneXr)
    )
  }
}
