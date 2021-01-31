import Color
import Common
import ComposableArchitecture
import Preview
import Shape
import SwiftUI
import Tabs

@main
struct App: SwiftUI.App {
  var body: some Scene {
    WindowGroup {
      if !isRunningTests {
        TabsView(store: Store(
          initialState: TabsState(
            selectedTab: .preview,
            color: ColorState(rgb: RGBColor(0.5, 0.5, 0.5)),
            shape: ShapeState(type: .square),
            preview: PreviewState()
          ),
          reducer: tabsReducer,
          environment: ()
        ))
      }
    }
  }
}
