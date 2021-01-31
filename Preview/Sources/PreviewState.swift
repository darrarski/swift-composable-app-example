import Color
import Shape

public struct PreviewState: Equatable {
  public init(color: RGBColor? = nil, shape: ShapeType? = nil) {
    self.color = color
    self.shape = shape
  }

  public var color: RGBColor?
  public var shape: ShapeType?
}
