// Adapted from https://github.com/tuist/microfeatures-example
// and also from: https://github.com/tuist/awesome-tuist#open-source-projects

import Foundation
import ProjectDescription

extension Project {
    public static func project(
        name: String,
        appName: String,
        organizationName: String = "dev.bressam",
        bundleId: String,
        deploymentTarget: DeploymentTargets = .iOS("17.0"),
        dependencies: [ProjectDescription.TargetDependency] = [],
        packages: [ProjectDescription.Package] = [],
        disableBundleAccessors: Bool = false,
        disableSynthesizedResourceAccessors: Bool = false
    ) -> Project {
        let testPlanFile = "AllTests.xctestplan"
        let module = Module(name: name, bundleId: bundleId)

        // MARK: - Schemes definition
        let mainScheme: Scheme = .scheme(
            name: module.mainTarget.name,
            shared: false,
            buildAction: .buildAction(
                targets: [.target(module.mainTarget.name)]
            ),
            testAction: .testPlans([
                .relativeToManifest(testPlanFile)
            ])
        )

        // MARK: - Targets definition
        var projectTargets = [Target]()

        // MARK: - Main Target
        projectTargets.append(
            .target(
                name: name,
                destinations: .iOS,
                product: .app,
                productName: appName,
                bundleId: module.mainTarget.bundleId,
                deploymentTargets: deploymentTarget,
                infoPlist: module.mainTarget.infoPlist,
                sources: module.mainTarget.sources,
                resources: module.mainTarget.resources,
                scripts: [.swiftLint],
                dependencies: dependencies
            )
        )

        return Project(
            name: name,
            organizationName: organizationName,
            options: .options(
                automaticSchemesOptions: .enabled(
                    targetSchemesGrouping: .notGrouped,
                    codeCoverageEnabled: true,
                    testingOptions: [],
                    testScreenCaptureFormat: .screenshots
                ),
                disableBundleAccessors: disableBundleAccessors,
                disableSynthesizedResourceAccessors: disableSynthesizedResourceAccessors
            ),
            packages: packages,
            settings: .settings(
                base: [
                "ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS": "YES",
                "ENABLE_USER_SCRIPT_SANDBOXING": "YES"
                ]),
            targets: projectTargets,
            schemes: [mainScheme],
            resourceSynthesizers: [.assets()]
        )
    }
}
