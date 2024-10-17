import ProjectDescription

extension ProjectDescription.SettingsDictionary {
    static let baseSettings: [String: SettingValue] = [
        "ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS": "YES",
        "ENABLE_USER_SCRIPT_SANDBOXING": "NO"
    ]
    
    static let moduleSettings: [String: SettingValue] = [
        "ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS": "YES",
        "ENABLE_USER_SCRIPT_SANDBOXING": "NO",
        "ENABLE_MODULE_VERIFIER": "YES",
        "MODULE_VERIFIER_SUPPORTED_LANGUAGE_STANDARDS": "gnu11 gnu++14"
    ]
}
