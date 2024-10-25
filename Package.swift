// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

@preconcurrency import PackageDescription

let package = Package(
    name: "MoodMoonitor",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .executable(name: "MoodMoonitor",
                    targets: ["MoodMoonitor"])
    ],
    dependencies: [
        .package(url: "https://github.com/airbnb/lottie-ios", exact: "4.5.0")
    ],
    targets: [
        .target(
            name: "MoodMoonitor",
            dependencies: [
                .product(name: "Lottie", package: "lottie-ios")
            ],
            path: "Sources"
        )
    ]
)
