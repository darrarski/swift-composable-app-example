public enum Tab: Int, CaseIterable {
  case color
  case shape
  case preview
}

extension Tab: Identifiable {
  public var id: Int { rawValue }
}
