import Foundation

public struct LibSkin {
    public private(set) static var registeredCores = [GameType: LibSkinCoreProtocol]()

    public static var dataSource: LibSkinDataSource?

    private init() { }

    public static func register(_ core: LibSkinCoreProtocol) {
        self.registeredCores[core.gameType] = core
    }

    public static func unregister(_ core: LibSkinCoreProtocol) {
        guard let registeredCore = self.registeredCores[core.gameType], registeredCore == core else { return }
        self.registeredCores[core.gameType] = nil
    }

    public static func core(for gameType: GameType) -> LibSkinCoreProtocol? {
        return self.registeredCores[gameType]
    }
}
