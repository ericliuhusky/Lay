// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Lay",
    products: [
        .library(
            name: "Lay",
            targets: ["Lay"]),
    ],
    dependencies: [
        
    ],
    targets: [
        .target(
            name: "Lay",
            dependencies: []),
        .testTarget(
            name: "LayTests",
            dependencies: ["Lay"]),
    ]
)
