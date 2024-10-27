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
                 path: "./Modules/MoodRegistry/Presentation"),
        .project(target: "RegisterMoodFeature",
                 path: "./Modules/RegisterMood/Presentation"),
        .project(target: "RegisterMoodFeatureInterface",
                 path: "./Modules/RegisterMood/Presentation"),
        .external(name: "FirebaseAuth"),
        .external(name: "FirebaseAuth")
    ],
    disableBundleAccessors: false,
    disableSynthesizedResourceAccessors: false
)
