// swift-tools-version:5.3
import PackageDescription

let package = Package(
  name: "Shape",
  platforms: [
    .iOS(.v14)
  ],
  products: [
    .library(
      name: "Shape",
      targets: ["Shape"]
    )
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Shape",
      dependencies: [],
      path: "Sources"
    ),
    .testTarget(
      name: "ShapeTests",
      dependencies: ["Shape"],
      path: "Tests"
    )
  ]
)
