import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.project(
    name: "MoodMoonitor",
    bundleId: "dev.bressam.mood-moonitor",
    dependencies: [
        .project(target: "DesignSystem",
                 path: "./Modules/DesignSystem/Components"),
        .project(target: "CoordinatorInterface",
                 path: "./Modules/CoordinatorModule/Coordinator"),
        .project(target: "Coordinator",
                 path: "./Modules/CoordinatorModule/Coordinator"),
        .project(target: "SignInFeature",
                 path: "./Modules/SignIn/Presentation"),
        .project(target: "SignInFeatureInterface",
                 path: "./Modules/SignIn/Presentation"),
        .project(target: "MoodRegistryFeature",
                 path: "./Modules/MoodRegistry/Presentation"),
        .project(target: "MoodRegistryFeatureInterface",
                 path: "./Modules/MoodRegistry/Presentation")
    ],
    disableBundleAccessors: false,
    disableSynthesizedResourceAccessors: false
)
