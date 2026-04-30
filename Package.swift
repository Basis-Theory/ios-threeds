// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ThreeDS",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ThreeDS",
            targets: ["ThreeDS"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(
            url: "https://github.com/unravelin/ravelin-3ds-sdk-ios-xcframework-distribution",
            from: "2.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(
            name: "Ravelin3DS",
            url:
                "https://ravelin.mycloudrepo.io/public/repositories/threeds2service-ios/release/2.0.0/Ravelin3DS.xcframework.zip",
            checksum: "6e2c68757ca1c6476156c6c069cfcc04998b017343034b4d30b58e660d62fc83"
        ),
        .target(
            name: "ThreeDS",
            dependencies: [
                "Ravelin3DS"
            ],
            path: "ThreeDS/Sources"
        ),
    ]
)
