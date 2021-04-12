struct TabsViewState: Equatable {
  init(state: TabsState) {
    selectedTab = state.selectedTab
  }

  var selectedTab: Tab
}
