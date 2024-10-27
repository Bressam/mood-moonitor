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
                 path: "../../../Modules/DesignSystem/Components"),
        .project(target: "MoodRegistryDomainInterface", path: "../../../Modules/MoodRegistry/Domain")
    ],
    interfaceDependencies: [
        .project(target: "CoordinatorInterface",
                 path: "../../../Modules/CoordinatorModule/Coordinator"),
        .project(target: "RegisterMoodDomainInterface", path: "../Domain"),
        .project(target: "RegisterMoodDataInterface", path: "../Data"),
        .project(target: "MoodRegistryDomainInterface", path: "../../../Modules/MoodRegistry/Domain")
    ],
    testDependencies: [
        .project(target: "RegisterMoodTesting", path: "../Testing")
    ],
    disableBundleAccessors: true,
    disableSynthesizedResourceAccessors: false
)
