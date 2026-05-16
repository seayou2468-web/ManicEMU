import Foundation

public struct Game: LibSkinGameProtocol {
    public var id: String
    public var name: String
    public var gameType: GameType
    public var portraitSkinID: String?
    public var landscapeSkinID: String?

    public init(id: String, name: String, gameType: GameType, portraitSkinID: String? = nil, landscapeSkinID: String? = nil) {
        self.id = id
        self.name = name
        self.gameType = gameType
        self.portraitSkinID = portraitSkinID
        self.landscapeSkinID = landscapeSkinID
    }
}
