import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: "MoodRegistryDomain",
    bundleIdPrefix: "dev.bressam.mood-moonitor",
    implementationDependencies: [],
    interfaceDependencies: [],
    testDependencies: [
        .project(target: "MoodRegistryTesting", path: "../Testing")
    ],
    disableBundleAccessors: true,
    disableSynthesizedResourceAccessors: false
)
