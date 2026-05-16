// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "LibSkin",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "LibSkin",
            targets: ["LibSkin"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SnapKit/SnapKit.git", from: "5.0.0"),
        .package(url: "https://github.com/tomkowz/Haptica.git", from: "3.0.0"),
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "8.0.0"),
        .package(url: "https://github.com/Daiuno/SmartCodable.git", from: "4.0.0"),
        .package(url: "https://github.com/YannickL/DynamicColor.git", from: "5.0.0"),
        .package(url: "https://github.com/yannickl/BetterSegmentedControl.git", from: "2.0.0"),
        .package(path: "../ZIPFoundation"),
        .package(path: "../ProHUD"),
    ],
    targets: [
        .target(
            name: "LibSkin",
            dependencies: [
                "SnapKit",
                "Haptica",
                "Kingfisher",
                "SmartCodable",
                "DynamicColor",
                "BetterSegmentedControl",
                "ProHUD",
                .product(name: "ZIPFoundation", package: "ZIPFoundation")
            ],
            path: "Sources/LibSkin",
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "LibSkinTests",
            dependencies: ["LibSkin"]),
    ]
)
