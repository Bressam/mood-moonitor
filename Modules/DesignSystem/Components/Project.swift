import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: "DesignSystem",
    hasInterface: false,
    bundleIdPrefix: "dev.bressam.mood-moonitor",
    implementationDependencies: [],
    interfaceDependencies: [],
    testDependencies: [
        .project(target: "DesignSystemTesting", path: "../Testing")
    ],
    disableBundleAccessors: false,
    disableSynthesizedResourceAccessors: false
)
