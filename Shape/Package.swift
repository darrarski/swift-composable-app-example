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
  dependencies: [
    .package(path: "../Common"),
    .package(path: "../Testing")
  ],
  targets: [
    .target(
      name: "Shape",
      dependencies: ["Common"],
      path: "Sources"
    ),
    .testTarget(
      name: "ShapeTests",
      dependencies: [
        "Shape",
        "Testing"
      ],
      path: "Tests",
      exclude: ["__Snapshots__"]
    )
  ]
)
