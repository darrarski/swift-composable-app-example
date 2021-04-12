import ComposableArchitecture

public let previewReducer = Reducer<PreviewState, PreviewAction, Void> { state, action, _ in
  switch action {
  case .reset:
    state.color = nil
    state.shape = nil
    return .none

  case .onAppear:
    return .none
  }
}
