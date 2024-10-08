// Adapted from https://github.com/tuist/microfeatures-example
// and also from: https://github.com/tuist/awesome-tuist#open-source-projects

import Foundation
import ProjectDescription

extension Project {
// MARK: - Project
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
        let application = Application(name: name, bundleId: bundleId)

        // MARK: Schemes definition
        let mainScheme: Scheme = .scheme(
            name: application.mainTarget.name,
            shared: false,
            buildAction: .buildAction(
                targets: [.target(application.mainTarget.name)]
            ),
            testAction: .testPlans([
                .relativeToManifest(testPlanFile)
            ])
        )

        // MARK: Targets definition
        var projectTargets = [Target]()

        // MARK: Main Target
        projectTargets.append(
            .target(
                name: name,
                destinations: .iOS,
                product: .app,
                productName: appName,
                bundleId: application.mainTarget.bundleId,
                deploymentTargets: deploymentTarget,
                infoPlist: application.mainTarget.infoPlist,
                sources: application.mainTarget.sources,
                resources: application.mainTarget.resources,
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
  
// MARK: - Module
    public static func module(
        name: String,
        hasInterface: Bool = true,
        hasTests: Bool = true,
        organizationName: String = "dev.bressam",
        bundleIdPrefix: String,
        deploymentTarget: DeploymentTargets = .iOS("17.0"),
        implementationDependencies: [ProjectDescription.TargetDependency] = [],
        interfaceDependencies: [ProjectDescription.TargetDependency] = [],
        testDependencies: [ProjectDescription.TargetDependency] = [],
        packages: [ProjectDescription.Package] = [],
        disableBundleAccessors: Bool = true,
        disableSynthesizedResourceAccessors: Bool = false
    ) -> Project {
        let testPlanFile = "AllTests.xctestplan"
        let module = Module(name: name,
                            bundleId: bundleIdPrefix + "." + name)
        
        // MARK: Schemes definition
        let mainScheme: Scheme = .scheme(
            name: module.mainTarget.name,
            shared: false,
            buildAction: .buildAction(
                targets: [.target(module.mainTarget.name)]
            )
        )
        
        // MARK: Targets definition
        var moduleTargets = [Target]()
        
        // MARK: Interface
        if hasInterface {
            moduleTargets.append(
                .target(
                    name: module.interfaceTarget.name,
                    destinations: .iOS,
                    product: .framework,
                    productName: module.interfaceTarget.name,
                    bundleId: module.interfaceTarget.bundleId,
                    deploymentTargets: deploymentTarget,
                    infoPlist: module.interfaceTarget.infoPlist,
                    sources: module.interfaceTarget.sources,
                    resources: module.interfaceTarget.resources,
                    scripts: [.swiftLint],
                    dependencies: interfaceDependencies
                )
            )
        }
        
        // MARK: Main Target
        let interfaceTarget: [ProjectDescription.TargetDependency] = hasInterface ? [ .target(name: module.interfaceTarget.name) ] : []
    
        moduleTargets.append(
            .target(
                name: module.mainTarget.name,
                destinations: .iOS,
                product: .framework,
                productName: module.mainTarget.name,
                bundleId: module.mainTarget.bundleId,
                deploymentTargets: deploymentTarget,
                infoPlist: module.mainTarget.infoPlist,
                sources: module.mainTarget.sources,
                resources: module.mainTarget.resources,
                scripts: [.swiftLint],
                dependencies: implementationDependencies + interfaceTarget
            )
        )
        
        // MARK: Test Target
        if hasTests {
            moduleTargets.append(
                .target(
                    name: module.testTarget.name,
                    destinations: .iOS,
                    product: .unitTests,
                    productName: module.testTarget.name,
                    bundleId: module.testTarget.bundleId,
                    deploymentTargets: deploymentTarget,
                    infoPlist: module.testTarget.infoPlist,
                    sources: module.testTarget.sources,
                    resources: module.testTarget.resources,
                    scripts: [.swiftLint],
                    dependencies: testDependencies + [
                        .target(name: module.mainTarget.name),
                        .target(name: module.interfaceTarget.name)
                    ]
                )
            )
        }

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
            targets: moduleTargets,
            schemes: [mainScheme],
            resourceSynthesizers: [.assets()]
        )
    }
}
