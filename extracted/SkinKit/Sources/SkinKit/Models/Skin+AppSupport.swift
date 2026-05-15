import Foundation
import RealmSwift
import IceCream

extension Skin {
    public var isFileExists: Bool {
        guard let path = skinData?.filePath?.path else { return false }
        return FileManager.default.fileExists(atPath: path)
    }

    public var fileURL: URL? {
        // App specific logic for default skins might need to be handled here or by a wrapper
        return skinData?.filePath
    }
}
