import Color
import ComposableArchitecture
import Shape
import SwiftUI

public struct PreviewView: View {
  public init(store: Store<PreviewState, PreviewAction>) {
    self.store = store
  }

  let store: Store<PreviewState, PreviewAction>

  public var body: some View {
    WithViewStore(store) { viewStore in
      Group {
        switch viewStore.shape {
        case .circle:
          Circle()

        case .square:
          Rectangle()
            .aspectRatio(1, contentMode: .fit)
        }
      }
      .padding()
      .foregroundColor(Color(
        .displayP3,
        red: viewStore.color.red,
        green: viewStore.color.green,
        blue: viewStore.color.blue,
        opacity: 1
      ))
    }
  }
}

struct PreviewView_Previews: PreviewProvider {
  static var previews: some View {
    PreviewView(store: Store(
      initialState: PreviewState(
        color: RGBColor(0.5, 0.5, 0.5),
        shape: .circle
      ),
      reducer: previewReducer,
      environment: ()
    ))
  }
}
