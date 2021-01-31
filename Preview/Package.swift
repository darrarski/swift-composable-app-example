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
  dependencies: [],
  targets: [
    .target(
      name: "Preview",
      dependencies: [],
      path: "Sources"
    ),
    .testTarget(
      name: "PreviewTests",
      dependencies: ["Preview"],
      path: "Tests"
    )
  ]
)
