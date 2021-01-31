import Common
import SwiftUI

@main
struct App: SwiftUI.App {
  var body: some Scene {
    WindowGroup {
      if !isRunningTests {
        AppView()
      }
    }
  }
}
