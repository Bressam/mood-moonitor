// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

@preconcurrency import PackageDescription

#if TUIST
// This makes possible to add custom settings for each imported library
import ProjectDescription
import ProjectDescriptionHelpers

let packageSettings = PackageSettings(
    productTypes: [
        // External libraries are static framework by default.
        // Changing to dynamic framework necessary ones
        "Lottie": .framework
    ],
    projectOptions: [
        // Tuist can generate resources synthetizers for each external and internal library if necessary
        "DesignSystem": .options(disableBundleAccessors: false,
                                 disableSynthesizedResourceAccessors: false)
    ]
)
#endif

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
