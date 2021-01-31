import ComposableArchitecture
import SwiftUI

public struct ColorView: View {
  public init(store: Store<ColorState, ColorAction>) {
    self.store = store
  }

  let store: Store<ColorState, ColorAction>

  public var body: some View {
    WithViewStore(store) { viewStore in
      VStack(alignment: .leading) {
        Text("Red")

        Slider(
          value: viewStore.binding(
            get: \.red,
            send: ColorAction.didUpdateRed
          ),
          in: (0...1)
        )
        .accentColor(.red)

        Text("Green")

        Slider(
          value: viewStore.binding(
            get: \.green,
            send: ColorAction.didUpdateGreen
          ),
          in: (0...1)
        )
        .accentColor(.green)

        Text("Blue")

        Slider(
          value: viewStore.binding(
            get: \.blue,
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
          red: viewStore.red,
          green: viewStore.green,
          blue: viewStore.blue,
          opacity: 1
        ),
        width: 8
      )
      .padding()
    }
  }
}

struct ColorView_Previews: PreviewProvider {
  static var previews: some View {
    ColorView(store: Store(
      initialState: ColorState(red: 0.5, green: 0.5, blue: 0.5),
      reducer: colorReducer,
      environment: ()
    ))
  }
}
