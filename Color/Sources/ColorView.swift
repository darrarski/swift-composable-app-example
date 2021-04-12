import ComposableArchitecture
import SwiftUI

public struct ColorView: View {
  public init(store: Store<ColorState, ColorAction>) {
    self.store = store
  }

  let store: Store<ColorState, ColorAction>

  public var body: some View {
    WithViewStore(store) { viewStore in
      VStack {
        VStack(alignment: .leading) {
          Text("Red")

          Slider(
            value: viewStore.binding(
              get: \.rgb.red,
              send: ColorAction.didUpdateRed
            ),
            in: (0...1)
          )
          .accentColor(.red)

          Text("Green")

          Slider(
            value: viewStore.binding(
              get: \.rgb.green,
              send: ColorAction.didUpdateGreen
            ),
            in: (0...1)
          )
          .accentColor(.green)

          Text("Blue")

          Slider(
            value: viewStore.binding(
              get: \.rgb.blue,
              send: ColorAction.didUpdateBlue
            ),
            in: (0...1)
          )
          .accentColor(.blue)
        }
        .padding()
        .border(
          Color(
            .displayP3,
            red: viewStore.rgb.red,
            green: viewStore.rgb.green,
            blue: viewStore.rgb.blue,
            opacity: 1
          ),
          width: 8
        )
        .padding()

        Button(action: { viewStore.send(.apply) }) {
          Text("Apply")
            .padding()
        }
      }
    }
  }
}

struct ColorView_Previews: PreviewProvider {
  static var previews: some View {
    ColorView(store: Store(
      initialState: ColorState(rgb: RGBColor(0.5, 0.5, 0.5)),
      reducer: colorReducer,
      environment: ()
    ))
  }
}
