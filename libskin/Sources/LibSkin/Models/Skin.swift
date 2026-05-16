import Foundation

public enum LibSkinType: Int, Codable {
    case `default`, buildIn, `import`, playcase
}

public struct LibSkinModel: Codable {
    public var id: String
    public var identifier: String
    public var name: String
    public var fileName: String
    public var gameType: GameType
    public var skinType: LibSkinType
    public var fileURL: URL

    public init(id: String, identifier: String, name: String, fileName: String, gameType: GameType, skinType: LibSkinType, fileURL: URL) {
        self.id = id
        self.identifier = identifier
        self.name = name
        self.fileName = fileName
        self.gameType = gameType
        self.skinType = skinType
        self.fileURL = fileURL
    }
}

// Map the old Skin class to LibSkinModel or define Skin as LibSkinModel
public typealias Skin = LibSkinModel
