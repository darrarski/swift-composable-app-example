enum AppTab: Int, CaseIterable {
  case color
  case shape
  case preview
}

extension AppTab: Identifiable {
  var id: Int { rawValue }
}
