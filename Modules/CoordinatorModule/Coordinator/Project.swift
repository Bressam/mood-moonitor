import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: "Coordinator",
    bundleIdPrefix: "dev.bressam.mood-moonitor",
    implementationDependencies: [],
    interfaceDependencies: [],
    testDependencies: [
        .project(target: "CoordinatorTesting", path: "../Testing")
    ],
    disableBundleAccessors: true,
    disableSynthesizedResourceAccessors: false
)
