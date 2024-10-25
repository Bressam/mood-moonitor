import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: "ModuleFeature",
    bundleIdPrefix: "dev.bressam.mood-moonitor",
    implementationDependencies: [
        .target(name: "ModuleFeatureInterface"),
        .project(target: "ModuleDomain", path: "../Domain"),
        .project(target: "ModuleData", path: "../Data")
    ],
    interfaceDependencies: [
        .project(target: "ModuleDomainInterface", path: "../Domain"),
        .project(target: "ModuleDataInterface", path: "../Data")
    ],
    testDependencies: [
        .project(target: "ModuleTesting", path: "../Testing")
    ],
    disableBundleAccessors: true,
    disableSynthesizedResourceAccessors: false
)
