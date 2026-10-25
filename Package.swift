// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "LayoutGrouping",
    products: [
        .library(
            name: "LayoutGrouping",
            targets: ["LayoutGrouping"]
        ),
    ],
    targets: [
        .target(
            name: "LayoutGrouping"
        ),
        .testTarget(
            name: "LayoutGroupingTests",
            dependencies: ["LayoutGrouping"]
        ),
    ]
)
