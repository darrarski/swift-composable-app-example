import ComposableArchitecture
import SwiftUI

public struct ShapeView: View {
  public init(store: Store<ShapeState, ShapeAction>) {
    self.store = store
  }

  let store: Store<ShapeState, ShapeAction>

  public var body: some View {
    WithViewStore(store) { viewStore in
      HStack {
        Spacer()

        Button(action: { viewStore.send(.didSelectType(.square)) }) {
          VStack {
            Rectangle()
              .stroke(lineWidth: 4)
              .frame(width: 50, height: 50)
              .overlay(Group {
                if viewStore.type == .square {
                  Image(systemName: "checkmark")
                    .imageScale(.large)
                } else {
                  EmptyView()
                }
              })

            Text("Square")
          }
          .padding()
        }

        Spacer()

        Button(action: { viewStore.send(.didSelectType(.circle)) }) {
          VStack {
            Circle()
              .stroke(lineWidth: 4)
              .frame(width: 50, height: 50)
              .overlay(Group {
                if viewStore.type == .circle {
                  Image(systemName: "checkmark")
                    .imageScale(.large)
                } else {
                  EmptyView()
                }
              })

            Text("Circle")
          }
          .padding()
        }

        Spacer()
      }
      .padding()
    }
  }
}

struct ShapeView_Previews: PreviewProvider {
  static var previews: some View {
    ShapeView(store: Store(
      initialState: ShapeState(type: .square),
      reducer: shapeReducer,
      environment: ()
    ))
  }
}
