import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: "SignInData",
    bundleIdPrefix: "dev.bressam.mood-moonitor",
    implementationDependencies: [
        .project(target: "SignInDomain", path: "../Domain")
    ],
    interfaceDependencies: [
        .project(target: "SignInDomainInterface", path: "../Domain")
    ],
    testDependencies: [
        .project(target: "SignInTesting", path: "../Testing")
    ],
    disableBundleAccessors: true,
    disableSynthesizedResourceAccessors: false
)
