import Color
import ComposableArchitecture
import Preview
import Shape

public let tabsReducer = Reducer<TabsState, TabsAction, Void>.combine(
  colorReducer.pullback(
    state: \.color,
    action: /TabsAction.color,
    environment: { _ in () }
  ),
  shapeReducer.pullback(
    state: \.shape,
    action: /TabsAction.shape,
    environment: { _ in () }
  ),
  previewReducer.pullback(
    state: \.preview,
    action: /TabsAction.preview,
    environment: { _ in () }
  ),
  Reducer { state, action, _ in
    switch action {
    case let .didSelectTab(tab):
      state.selectedTab = tab
      return .none

    case .color(.apply):
      state.preview.color = state.color.rgb
      return .none

    case .shape(.apply):
      state.preview.shape = state.shape.type
      return .none

    case .color, .shape, .preview:
      return .none
    }
  }
)
