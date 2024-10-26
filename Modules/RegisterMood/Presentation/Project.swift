import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: "RegisterMoodFeature",
    bundleIdPrefix: "dev.bressam.mood-moonitor",
    implementationDependencies: [
        .project(target: "RegisterMoodTesting", path: "../Testing"),
        .project(target: "RegisterMoodDomain", path: "../Domain"),
        .project(target: "RegisterMoodData", path: "../Data"),
        .project(target: "DesignSystem",
                 path: "../../../Modules/DesignSystem/Components")
    ],
    interfaceDependencies: [
        .project(target: "RegisterMoodDomainInterface", path: "../Domain"),
        .project(target: "RegisterMoodDataInterface", path: "../Data")
    ],
    testDependencies: [
        .project(target: "RegisterMoodTesting", path: "../Testing")
    ],
    disableBundleAccessors: true,
    disableSynthesizedResourceAccessors: false
)
