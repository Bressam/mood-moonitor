import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: "RegisterMoodData",
    bundleIdPrefix: "dev.bressam.mood-moonitor",
    implementationDependencies: [
        .project(target: "RegisterMoodDomain", path: "../Domain")
    ],
    interfaceDependencies: [
        .project(target: "RegisterMoodDomainInterface", path: "../Domain"),
        .project(target: "MoodRegistryDomainInterface", path: "../../../Modules/MoodRegistry/Domain")
    ],
    testDependencies: [
        .project(target: "RegisterMoodTesting", path: "../Testing")
    ],
    disableBundleAccessors: true,
    disableSynthesizedResourceAccessors: false
)
