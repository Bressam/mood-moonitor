import Foundation
import ProjectDescription

struct Module {
    let name: String
    let bundleId: String

    var mainTarget: Target {
        Target(
            name: name,
            sources: "Sources/**",
            resources: "Resources/**",
            infoPlist: .extendingDefault(with: [
                "UILaunchScreen" : [
                    "UIColorName": "launchscreen-background",
                    "UIImageName": "launchscreen-logo"
                ],
                "UILaunchStoryboardName" : "Launch Screen.storyboard"
            ]),
            bundleId: bundleId
        )
    }

    struct Target {
        let name: String
        let sources: SourceFilesList
        let resources: ResourceFileElements?
        let infoPlist: InfoPlist
        let bundleId: String

        init(name: String, sources: String, resources: String? = nil, infoPlist: InfoPlist? = nil, bundleId: String) {
            self.name = name
            self.sources = SourceFilesList(stringLiteral: sources)
            self.resources = resources == nil ? nil : ResourceFileElements(stringLiteral: resources!)
            self.infoPlist = infoPlist == nil ? .default : infoPlist!
            self.bundleId = bundleId
        }
    }
}

