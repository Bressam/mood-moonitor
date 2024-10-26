import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: "RegisterMoodDomain",
    bundleIdPrefix: "dev.bressam.mood-moonitor",
    implementationDependencies: [],
    interfaceDependencies: [],
    testDependencies: [
        .project(target: "RegisterMoodTesting", path: "../Testing")
    ],
    disableBundleAccessors: true,
    disableSynthesizedResourceAccessors: false
)
