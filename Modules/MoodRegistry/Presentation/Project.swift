import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: "MoodRegistryFeature",
    bundleIdPrefix: "dev.bressam.mood-moonitor",
    implementationDependencies: [
        .project(target: "MoodRegistryTesting", path: "../Testing"),
        .project(target: "MoodRegistryDomain", path: "../Domain"),
        .project(target: "MoodRegistryData", path: "../Data"),
        .project(target: "DesignSystem",
                 path: "../../../Modules/DesignSystem/Components"),
        .project(target: "RegisterMoodFeatureInterface",
                 path: "../../../Modules/RegisterMood/Presentation")
    ],
    interfaceDependencies: [
        .project(target: "MoodRegistryDomainInterface", path: "../Domain"),
        .project(target: "MoodRegistryDataInterface", path: "../Data")
    ],
    testDependencies: [
        .project(target: "MoodRegistryTesting", path: "../Testing")
    ],
    disableBundleAccessors: true,
    disableSynthesizedResourceAccessors: false
)
