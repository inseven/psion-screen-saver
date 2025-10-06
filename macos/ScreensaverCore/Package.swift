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
    targets: [
        .target(
            name: "ScreensaverCore",
            resources: [
                .process("Resources")
            ]
        ),

    ]
)
