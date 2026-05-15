import Foundation
import ZIPFoundation

public class SkinDocument {
    public let url: URL
    public let info: SkinInfo

    public init(url: URL) throws {
        self.url = url
        guard let archive = Archive(url: url, accessMode: .read) else {
            throw SkinError.invalidArchive
        }
        let data = try archive.extractData(from: "info.json")
        self.info = try JSONDecoder().decode(SkinInfo.self, from: data)
    }

    public func extractAsset(named name: String) throws -> Data {
        guard let archive = Archive(url: url, accessMode: .read) else {
            throw SkinError.invalidArchive
        }
        return try archive.extractData(from: name)
    }
}
