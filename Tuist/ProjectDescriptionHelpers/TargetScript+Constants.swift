import ProjectDescription

extension TargetScript {
    static let swiftLint = TargetScript.post(
        script: swiftLintScript,
        name: "SwiftLint script",
        basedOnDependencyAnalysis: false
    )
}
