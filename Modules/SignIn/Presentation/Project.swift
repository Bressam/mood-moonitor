import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: "SignInFeature",
    bundleIdPrefix: "dev.bressam.mood-moonitor",
    implementationDependencies: [],
    interfaceDependencies: [
        .project(target: "SignInDomainInterface", path: "../Domain")
    ],
    testDependencies: [
        .project(target: "SignInTesting", path: "../Testing")
    ],
    disableBundleAccessors: true,
    disableSynthesizedResourceAccessors: false
)
