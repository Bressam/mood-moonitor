import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: "MoodRegistryData",
    bundleIdPrefix: "dev.bressam.mood-moonitor",
    implementationDependencies: [
        .project(target: "MoodRegistryDomain", path: "../Domain")
    ],
    interfaceDependencies: [
        .project(target: "MoodRegistryDomainInterface", path: "../Domain")
    ],
    testDependencies: [
        .project(target: "MoodRegistryTesting", path: "../Testing")
    ],
    disableBundleAccessors: true,
    disableSynthesizedResourceAccessors: false
)
