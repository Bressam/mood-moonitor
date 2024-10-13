import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: "ModuleDomain",
    bundleIdPrefix: "dev.bressam.mood-moonitor",
    implementationDependencies: [],
    interfaceDependencies: [],
    testDependencies: [
        .project(target: "ModuleTesting", path: "../Testing")
    ],
    disableBundleAccessors: true,
    disableSynthesizedResourceAccessors: false
)
