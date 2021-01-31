// swift-tools-version:5.3
import PackageDescription

let package = Package(
  name: "Testing",
  platforms: [
    .iOS(.v14)
  ],
  products: [
    .library(
      name: "Testing",
      targets: ["Testing"]
    )
  ],
  dependencies: [
    .package(
      name: "SnapshotTesting",
      url: "https://github.com/pointfreeco/swift-snapshot-testing.git",
      from: "1.8.2"
    )
  ],
  targets: [
    .target(
      name: "Testing",
      dependencies: ["SnapshotTesting"],
      path: "Sources"
    )
  ]
)
