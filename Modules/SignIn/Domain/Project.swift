import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: "SignInDomain",
    bundleIdPrefix: "dev.bressam.mood-moonitor",
    implementationDependencies: [
        .project(target: "SignInData", path: "../Data")
    ],
    interfaceDependencies: [
        .project(target: "SignInDataInterface", path: "../Data")
    ],
    testDependencies: [
        .project(target: "SignInTesting", path: "../Testing")
    ],
    disableBundleAccessors: true,
    disableSynthesizedResourceAccessors: false
)
