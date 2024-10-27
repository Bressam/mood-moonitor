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
        "Lottie": .framework,
        "FirebaseAuth": .staticLibrary,
        "FirebaseFirestore": .staticLibrary
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
        .package(url: "https://github.com/airbnb/lottie-ios",
                 exact: "4.5.0"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk",
                 .upToNextMajor(from: "11.4.0"))
    ],
    targets: [
        .target(
            name: "MoodMoonitor",
            dependencies: [
                .product(name: "Lottie", package: "lottie-ios"),
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk"),
                .product(name: "FirebaseFirestore", package: "firebase-ios-sdk"),
            ],
            path: "Sources"
        )
    ]
)
