import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: "SignInFeature",
    bundleIdPrefix: "dev.bressam.mood-moonitor",
    implementationDependencies: [
        .target(name: "SignInFeatureInterface"),
        .project(target: "SignInDomain", path: "../Domain"),
        .project(target: "SignInData", path: "../Data")
    ],
    interfaceDependencies: [
        .project(target: "SignInDomainInterface", path: "../Domain"),
        .project(target: "SignInDataInterface", path: "../Data")
    ],
    testDependencies: [
        .project(target: "SignInTesting", path: "../Testing")
    ],
    disableBundleAccessors: true,
    disableSynthesizedResourceAccessors: false
)
