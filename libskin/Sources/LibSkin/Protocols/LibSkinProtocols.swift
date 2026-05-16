import Foundation
import UIKit

public protocol LibSkinGameProtocol {
    var id: String { get }
    var name: String { get }
    var gameType: GameType { get }
    var portraitSkinID: String? { get set }
    var landscapeSkinID: String? { get set }
}

public protocol LibSkinDataSource: AnyObject {
    func skins(for gameType: GameType?) -> [LibSkinModel]
    func games(for gameType: GameType?) -> [LibSkinGameProtocol]
    func updateSkin(for game: LibSkinGameProtocol, portraitSkinID: String?, landscapeSkinID: String?)
    func deleteSkin(_ skin: LibSkinModel)
}

public protocol LibSkinDelegate: AnyObject {
    func libSkinDidSelectSkin(_ skin: LibSkinModel)
}

public protocol LibSkinSkinProtocol {
    var id: String { get }
    var identifier: String { get }
    var name: String { get }
    var fileName: String { get }
    var gameType: GameType { get }
    var fileURL: URL { get }
}

extension LibSkinModel: LibSkinSkinProtocol {}
