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
    .package(path: "../Common"),
    .package(path: "../Color"),
    .package(path: "../Shape"),
    .package(path: "../Preview"),
    .package(path: "../Testing")
  ],
  targets: [
    .target(
      name: "Tabs",
      dependencies: [
        "Common",
        "Color",
        "Shape",
        "Preview"
      ],
      path: "Sources"
    ),
    .testTarget(
      name: "TabsTests",
      dependencies: [
        "Tabs",
        "Testing"
      ],
      path: "Tests"
    )
  ]
)
