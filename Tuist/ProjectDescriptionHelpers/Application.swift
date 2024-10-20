import Foundation
import ProjectDescription

struct Application {
    let name: String
    let bundleId: String
    
    private let implementationPrefix = "Implementation"
    private let implementationSufix = "Implementation"

    private let interfacePrefix = "Interface"
    private let interfaceSufix = "Interface"

    private let testingPrefix = "Testing"
    private let testingSufix = "Testing"

    var mainTarget: Target {
        Target(
            name: name,
            sources: "Sources/**",
            resources: "Resources/**",
            infoPlist: .mainAppInfoPlist,
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

