import ComposableArchitecture

public let colorReducer = Reducer<ColorState, ColorAction, Void> { state, action, _ in
  switch action {
  case let .didUpdateRed(value):
    state.rgb.red = max(0, min(1, value))
    return .none

  case let .didUpdateGreen(value):
    state.rgb.green = max(0, min(1, value))
    return .none

  case let .didUpdateBlue(value):
    state.rgb.blue = max(0, min(1, value))
    return .none
  }
}
