import Foundation
import AVFoundation

public protocol LibSkinCoreProtocol: CustomStringConvertible
{
    /* General */
    var name: String { get }
    var identifier: String { get }
    var version: String? { get }

    var gameType: GameType { get }
    var gameSaveCustomPath: String? { get }
    var gameSaveExtension: String { get }

    // Should be associated type, but Swift type system makes this difficult, so ¯\_(ツ)_/¯
    var gameInputType: Input.Type { get }

    var allInputs: [Input] { get }

    /* Rendering */
    var audioFormat: AVAudioFormat { get }
    var videoFormat: VideoFormat { get }

    /* Cheats */
    var supportCheatFormats: Set<CheatFormat> { get }

    /* Emulation */
    var emulatorConnector: EmulatorBase { get }

    var resourceBundle: Bundle { get }
}

public extension LibSkinCoreProtocol
{
    var version: String? {
        return nil
    }

    var gameSaveCustomPath: String? {
        return nil
    }
}

public func ==(lhs: LibSkinCoreProtocol?, rhs: LibSkinCoreProtocol?) -> Bool
{
    return lhs?.identifier == rhs?.identifier
}

public func !=(lhs: LibSkinCoreProtocol?, rhs: LibSkinCoreProtocol?) -> Bool
{
    return !(lhs == rhs)
}

public func ~=(pattern: LibSkinCoreProtocol?, value: LibSkinCoreProtocol?) -> Bool
{
    return pattern == value
}
