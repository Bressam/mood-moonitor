import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: "DesignSystem",
    hasInterface: false,
    bundleIdPrefix: "dev.bressam.mood-moonitor",
    implementationDependencies: [
        .project(target: "MoodRegistryDomainInterface", path: "../../../Modules/MoodRegistry/Domain"),
        .external(name: "Lottie")
    ],
    interfaceDependencies: [],
    testDependencies: [
        .project(target: "DesignSystemTesting", path: "../Testing")
    ],
    disableBundleAccessors: false,
    disableSynthesizedResourceAccessors: false
)
