import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: "RegisterMoodDomain",
    bundleIdPrefix: "dev.bressam.mood-moonitor",
    implementationDependencies: [
        .project(target: "MoodRegistryDomainInterface", path: "../../../Modules/MoodRegistry/Domain")
    ],
    interfaceDependencies: [
        .project(target: "MoodRegistryDomainInterface", path: "../../../Modules/MoodRegistry/Domain")
    ],
    testDependencies: [
        .project(target: "RegisterMoodTesting", path: "../Testing")
    ],
    disableBundleAccessors: true,
    disableSynthesizedResourceAccessors: false
)
