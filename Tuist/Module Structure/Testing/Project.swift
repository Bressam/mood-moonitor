import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: "ModuleTesting",
    hasInterface: false,
    hasTests: false,
    bundleIdPrefix: "dev.bressam.mood-moonitor",
    implementationDependencies: [
        .project(target: "ModuleDataInterface", path: "../Data"),
        .project(target: "ModuleDomainInterface", path: "../Domain")
    ],
    disableBundleAccessors: true,
    disableSynthesizedResourceAccessors: false
)
