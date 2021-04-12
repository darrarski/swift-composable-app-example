import ComposableArchitecture
import SwiftUI

public struct ShapeView: View {
  public init(store: Store<ShapeState, ShapeAction>) {
    self.store = store
  }

  let store: Store<ShapeState, ShapeAction>

  public var body: some View {
    WithViewStore(store) { viewStore in
      VStack {
        HStack {
          Spacer()

          Button(action: { viewStore.send(.didSelectType(.square)) }) {
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
              .padding()
          }

          Spacer()

          Button(action: { viewStore.send(.didSelectType(.circle)) }) {
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
              .padding()
          }

          Spacer()
        }

        Button(action: { viewStore.send(.apply) }) {
          Text("Apply")
            .padding()
        }
      }
      .padding()
      .onAppear {
        viewStore.send(.onAppear)
      }
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
