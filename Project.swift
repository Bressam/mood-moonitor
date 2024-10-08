import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.project(
    name: "MoodMoonitor",
    appName: "Mood Moonitor",
    bundleId: "dev.bressam.mood-moonitor",
    dependencies: [
        .project(target: "SignIn", path: "./Modules/SignIn")
    ],
    disableBundleAccessors: false,
    disableSynthesizedResourceAccessors: false
)
