import Foundation

public protocol LibSkinSettingsProtocol {
    func updateExtra(key: String, value: String)
    func getExtra(key: String) -> String?
    func getExtraBool(key: String) -> Bool?

    var skinConfig: [String: String] { get set }
}

public struct LibSkinSettings {
    public static var shared: LibSkinSettingsProtocol!
}
