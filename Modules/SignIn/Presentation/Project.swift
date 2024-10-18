import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: "SignInFeature",
    bundleIdPrefix: "dev.bressam.mood-moonitor",
    implementationDependencies: [
        .project(target: "SignInDomain", path: "../Domain"),
        .project(target: "SignInData", path: "../Data"),
        .project(target: "DesignSystem",
                 path: "../../../Modules/DesignSystem/Components")
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
