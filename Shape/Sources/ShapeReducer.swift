import ComposableArchitecture

public let shapeReducer = Reducer<ShapeState, ShapeAction, Void> { state, action, _ in
  switch action {
  case let .didSelectType(value):
    state.type = value
    return .none

  case .apply:
    return .none
  }
}
