import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: "DesignSystem",
    hasInterface: false,
    bundleIdPrefix: "dev.bressam.mood-moonitor",
    implementationDependencies: [
        .external(name: "Lottie")
    ],
    interfaceDependencies: [],
    testDependencies: [
        .project(target: "DesignSystemTesting", path: "../Testing")
    ],
    disableBundleAccessors: false,
    disableSynthesizedResourceAccessors: false
)
