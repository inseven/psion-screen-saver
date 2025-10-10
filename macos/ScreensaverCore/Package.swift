// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "ScreensaverCore",
    platforms: [
        .macOS(.v15),
    ],
    products: [
        .library(
            name: "ScreensaverCore",
            targets: ["ScreensaverCore"]),
    ],
    dependencies: [
        .package(path: "../dependencies/diligence"),
    ],
    targets: [
        .target(
            name: "ScreensaverCore",
            dependencies: [
                .product(name: "Diligence", package: "diligence"),
            ],
            resources: [
                .process("Resources")
            ]
        ),

    ]
)
