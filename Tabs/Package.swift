// swift-tools-version:5.3
import PackageDescription

let package = Package(
  name: "Tabs",
  platforms: [
    .iOS(.v14)
  ],
  products: [
    .library(
      name: "Tabs",
      targets: ["Tabs"]
    )
  ],
  dependencies: [
    .package(path: "../Common")
  ],
  targets: [
    .target(
      name: "Tabs",
      dependencies: ["Common"],
      path: "Sources"
    ),
    .testTarget(
      name: "TabsTests",
      dependencies: ["Tabs"],
      path: "Tests"
    )
  ]
)
