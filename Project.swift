import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.project(
    name: "MoodMoonitor",
    appName: "Mood Moonitor",
    bundleId: "dev.bressam.mood-moonitor",
    dependencies: [
        .project(target: "SignInFeature",
                 path: "./Modules/SignIn/Presentation"),
        .project(target: "SignInFeatureInterface",
                 path: "./Modules/SignIn/Presentation")
    ],
    disableBundleAccessors: false,
    disableSynthesizedResourceAccessors: false
)
