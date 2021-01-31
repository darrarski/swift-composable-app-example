public struct ShapeState: Equatable {
  public init(type: ShapeType) {
    self.type = type
  }

  public var type: ShapeType
}
