// swift-tools-version:5.3
import PackageDescription

let package = Package(
  name: "Common",
  platforms: [
    .iOS(.v14)
  ],
  products: [
    .library(
      name: "Common",
      targets: ["Common"]
    )
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Common",
      dependencies: [],
      path: "Sources"
    ),
    .testTarget(
      name: "CommonTests",
      dependencies: ["Common"],
      path: "Tests"
    )
  ]
)
