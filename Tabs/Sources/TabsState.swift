import Color
import Preview
import Shape

public struct TabsState: Equatable {
  public init(
    selectedTab: Tab,
    color: ColorState,
    shape: ShapeState,
    preview: PreviewState
  ) {
    self.selectedTab = selectedTab
    self.color = color
    self.shape = shape
    self.preview = preview
  }

  public var selectedTab: Tab
  public var color: ColorState
  public var shape: ShapeState
  public var preview: PreviewState
}
