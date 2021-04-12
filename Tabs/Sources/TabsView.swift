import Color
import ComposableArchitecture
import Preview
import Shape
import SwiftUI

public struct TabsView: View {
  public init(store: Store<TabsState, TabsAction>) {
    self.store = store
  }

  let store: Store<TabsState, TabsAction>

  public var body: some View {
    WithViewStore(store.scope(state: TabsViewState.init(state:))) { viewStore in
      TabView(selection: viewStore.binding(
        get: \.selectedTab,
        send: TabsAction.didSelectTab
      )) {
        ForEach(Tab.allCases, content: tabView(_:))
      }
    }
  }

  private func tabView(_ tab: Tab) -> some View {
    view(for: tab)
      .tabItem {
        Image(systemName: image(for: tab))
        Text(title(for: tab))
      }
      .tag(tab)
  }

  private func title(for tab: Tab) -> String {
    switch tab {
    case .color: return "Color"
    case .shape: return "Shape"
    case .preview: return "Preview"
    }
  }

  private func image(for tab: Tab) -> String {
    switch tab {
    case .color: return "eyedropper.halffull"
    case .shape: return "square.on.circle"
    case .preview: return "eye"
    }
  }

  @ViewBuilder
  private func view(for tab: Tab) -> some View {
    switch tab {
    case .color:
      ColorView(store: store.scope(
        state: \.color,
        action: TabsAction.color
      ))
      .onAppear {
        ViewStore(store.stateless).send(.color(.onAppear))
      }

    case .shape:
      ShapeView(store: store.scope(
        state: \.shape,
        action: TabsAction.shape
      ))
      .onAppear {
        ViewStore(store.stateless).send(.shape(.onAppear))
      }

    case .preview:
      PreviewView(store: store.scope(
        state: \.preview,
        action: TabsAction.preview
      ))
      .onAppear {
        ViewStore(store.stateless).send(.preview(.onAppear))
      }
    }
  }
}

struct TabsView_Previews: PreviewProvider {
  static var previews: some View {
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
