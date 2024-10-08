import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: "SignInFeature",
    bundleIdPrefix: "dev.bressam.mood-moonitor",
    implementationDependencies: [
        .project(target: "SignInDomain", path: "../Domain")
    ],
    interfaceDependencies: [
        .project(target: "SignInDomainInterface", path: "../Domain")
    ],
    disableBundleAccessors: true,
    disableSynthesizedResourceAccessors: false
)
