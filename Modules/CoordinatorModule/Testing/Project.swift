import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: "CoordinatorTesting",
    hasInterface: false,
    hasTests: false,
    bundleIdPrefix: "dev.bressam.mood-moonitor",
    implementationDependencies: [
        .project(target: "Coordinator", path: "../Coordinator"),
        .project(target: "CoordinatorInterface", path: "../Coordinator")
    ],
    disableBundleAccessors: true,
    disableSynthesizedResourceAccessors: false
)
