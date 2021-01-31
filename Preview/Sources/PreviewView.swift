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
      if let color = viewStore.color,
         let shape = viewStore.shape {
        Group {
          switch shape {
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
          red: color.red,
          green: color.green,
          blue: color.blue,
          opacity: 1
        ))
      } else {
        VStack {
          Text("No preview").font(.title)
          Text("Apply color and shape first")
        }
      }
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
