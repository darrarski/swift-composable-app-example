import Color
import Preview
import Shape

public enum TabsAction: Equatable {
  case didSelectTab(Tab)
  case color(ColorAction)
  case shape(ShapeAction)
  case preview(PreviewAction)
}
