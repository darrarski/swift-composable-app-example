// swift-tools-version:5.3
import PackageDescription

let package = Package(
  name: "Color",
  platforms: [
    .iOS(.v14)
  ],
  products: [
    .library(
      name: "Color",
      targets: ["Color"]
    )
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Color",
      dependencies: [],
      path: "Sources"
    ),
    .testTarget(
      name: "ColorTests",
      dependencies: ["Color"],
      path: "Tests"
    )
  ]
)
