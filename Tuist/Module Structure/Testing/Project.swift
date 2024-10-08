import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: "SignInTesting",
    hasInterface: false,
    hasTests: false,
    bundleIdPrefix: "dev.bressam.mood-moonitor",
    implementationDependencies: [
        .project(target: "SignInDataInterface", path: "../Data"),
        .project(target: "SignInDomainInterface", path: "../Domain")
    ],
    disableBundleAccessors: true,
    disableSynthesizedResourceAccessors: false
)
