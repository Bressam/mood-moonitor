import Foundation
import ProjectDescription

struct Module {
    let name: String
    let bundleId: String
    
    private let implementationPrefix = "Implementation"
    private let implementationSufix = "Implementation"

    private let interfacePrefix = "Interface"
    private let interfaceSufix = "Interface"

    var mainTarget: Target {
        Target(
            name: name,
            sources: implementationPrefix + "/Sources/**",
            resources: implementationPrefix + "/Resources/**",
            infoPlist: .default,
            bundleId: bundleId
        )
    }
    
    var interfaceTarget: Target {
        Target(
            name: "\(name)\(interfaceSufix)",
            sources: interfacePrefix + "/Sources/**",
            resources: interfacePrefix + "/Resources/**",
            infoPlist: .default,
            bundleId: "\(bundleId).interface"
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

