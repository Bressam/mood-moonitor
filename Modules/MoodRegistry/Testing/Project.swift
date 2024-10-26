import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: "MoodRegistryTesting",
    hasInterface: false,
    hasTests: false,
    bundleIdPrefix: "dev.bressam.mood-moonitor",
    implementationDependencies: [
        .project(target: "MoodRegistryDataInterface", path: "../Data"),
        .project(target: "MoodRegistryDomainInterface", path: "../Domain")
    ],
    disableBundleAccessors: true,
    disableSynthesizedResourceAccessors: false
)
