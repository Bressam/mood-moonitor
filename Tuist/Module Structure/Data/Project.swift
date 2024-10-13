import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: "ModuleData",
    bundleIdPrefix: "dev.bressam.mood-moonitor",
    implementationDependencies: [],
    interfaceDependencies: [
        .project(target: "ModuleDomainInterface", path: "../Domain")
    ],
    testDependencies: [
        .project(target: "ModulenTesting", path: "../Testing")
    ],
    disableBundleAccessors: true,
    disableSynthesizedResourceAccessors: false
)
