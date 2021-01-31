import SwiftUI
import Color
import Shape
import Preview

struct AppView: View {
  @State var selectedTab = AppTab.preview

  var body: some View {
    TabView(selection: $selectedTab) {
      ForEach(AppTab.allCases, content: tabView(_:))
    }
  }

  private func tabView(_ tab: AppTab) -> some View {
    view(for: tab)
      .tabItem {
        Image(systemName: image(for: tab))
        Text(title(for: tab))
      }
      .tag(tab)
  }

  private func title(for tab: AppTab) -> String {
    switch tab {
    case .color: return "Color"
    case .shape: return "Shape"
    case .preview: return "Preview"
    }
  }

  private func image(for tab: AppTab) -> String {
    switch tab {
    case .color: return "eyedropper.halffull"
    case .shape: return "square.on.circle"
    case .preview: return "eye"
    }
  }

  @ViewBuilder
  private func view(for tab: AppTab) -> some View {
    switch tab {
    case .color: ColorView()
    case .shape: ShapeView()
    case .preview: PreviewView()
    }
  }
}

struct AppView_Previews: PreviewProvider {
  static var previews: some View {
    AppView()
  }
}
