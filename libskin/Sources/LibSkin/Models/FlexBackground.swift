import Foundation
import SmartCodable
import UIKit

public struct FlexBackground: SmartCodable, Equatable {
    public enum BackgroundType {
        case game, console, global
    }

    public var name: String = ""
    public var hash: String = ""
    public var games: [String] = []
    public var consoles: [String] = []
    public var global: Bool = false

    public var isValid: Bool {
        return !(games.isEmpty && consoles.isEmpty && !global)
    }

    public var imageUrl: URL {
        URL(fileURLWithPath: LibSkinConstants.Path.assetsDirectory.appendingPathComponent(name).path)
    }

    public static func == (lhs: Self, rhs: Self) -> Bool {
        guard lhs.name == rhs.name, lhs.hash == rhs.hash, lhs.games == rhs.games, lhs.consoles == rhs.consoles, lhs.global == rhs.global else {
            return false
        }
        return true
    }

    public init() {}

    public static func getAllBackground() -> [FlexBackground] {
        guard let jsonString = LibSkinSettings.shared.getExtra(key: ExtraKey.flexBackground.rawValue),
              let data = jsonString.data(using: .utf8),
              let backgrounds = try? JSONDecoder().decode([FlexBackground].self, from: data) else {
            return []
        }
        return backgrounds
    }
}
