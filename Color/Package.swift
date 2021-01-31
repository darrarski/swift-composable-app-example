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
  dependencies: [
    .package(path: "../Common")
  ],
  targets: [
    .target(
      name: "Color",
      dependencies: ["Common"],
      path: "Sources"
    ),
    .testTarget(
      name: "ColorTests",
      dependencies: ["Color"],
      path: "Tests"
    )
  ]
)
