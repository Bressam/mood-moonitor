import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: "RegisterMoodTesting",
    hasInterface: false,
    hasTests: false,
    bundleIdPrefix: "dev.bressam.mood-moonitor",
    implementationDependencies: [
        .project(target: "RegisterMoodFeatureInterface", path: "../Presentation"),
        .project(target: "RegisterMoodDataInterface", path: "../Data"),
        .project(target: "RegisterMoodDomainInterface", path: "../Domain"),
        .project(target: "MoodRegistryDomainInterface", path: "../../../Modules/MoodRegistry/Domain")
    ],
    disableBundleAccessors: true,
    disableSynthesizedResourceAccessors: false
)
