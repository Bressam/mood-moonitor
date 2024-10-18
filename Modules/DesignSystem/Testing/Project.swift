import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: "DesignSystemTesting",
    hasInterface: false,
    hasTests: false,
    bundleIdPrefix: "dev.bressam.mood-moonitor",
    implementationDependencies: [
        .project(target: "DesignSystem", path: "../Components")
    ],
    disableBundleAccessors: true,
    disableSynthesizedResourceAccessors: false
)
