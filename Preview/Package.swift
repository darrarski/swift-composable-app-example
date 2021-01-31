// swift-tools-version:5.3
import PackageDescription

let package = Package(
  name: "Preview",
  platforms: [
    .iOS(.v14)
  ],
  products: [
    .library(
      name: "Preview",
      targets: ["Preview"]
    )
  ],
  dependencies: [
    .package(path: "../Common"),
    .package(path: "../Color"),
    .package(path: "../Shape")
  ],
  targets: [
    .target(
      name: "Preview",
      dependencies: [
        "Common",
        "Color",
        "Shape"
      ],
      path: "Sources"
    ),
    .testTarget(
      name: "PreviewTests",
      dependencies: ["Preview"],
      path: "Tests"
    )
  ]
)
