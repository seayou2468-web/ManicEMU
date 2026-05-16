import Foundation
import SmartCodable

public enum ExtraKey: String {
    case flexBackground = "flexBackground"
    case airPlayScaling = "airPlayScaling"
    case airPlayLayout = "airPlayLayout"
    case skinSoundEffects = "skinSoundEffects"
}

public struct LibSkinConfig: SmartCodable {
    public var portraitSkins = [String: String]()
    public var landscapeSkins = [String: String]()

    public init() {}

    public static func preferredSkinID(gameType: GameType, isLandscape: Bool) -> String? {
        guard let sharedSettings = LibSkinSettings.shared else { return nil }
        // For now, we assume skinConfig is a JSON string of LibSkinConfig
        if let data = sharedSettings.getExtra(key: "skinConfig")?.data(using: .utf8),
           let config = try? JSONDecoder().decode(LibSkinConfig.self, from: data) {
            return isLandscape ? config.landscapeSkins[gameType.rawValue] : config.portraitSkins[gameType.rawValue]
        }
        return nil
    }
}
