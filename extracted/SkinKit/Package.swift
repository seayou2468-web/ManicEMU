// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SkinKit",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "SkinKit",
            targets: ["SkinKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/weichsel/ZIPFoundation.git", upToNextMajor: "0.9.0"),
        .package(url: "https://github.com/realm/realm-swift.git", upToNextMajor: "10.0.0"),
        .package(url: "https://github.com/caiyue1993/IceCream.git", upToNextMajor: "2.0.0"),
    ],
    targets: [
        .target(
            name: "SkinKit",
            dependencies: [
                "ZIPFoundation",
                .product(name: "RealmSwift", package: "realm-swift"),
                "IceCream"
            ]),
    ]
)
