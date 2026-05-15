import Foundation
import ZIPFoundation

extension Archive {
    public func extractData(from entryName: String) throws -> Data {
        guard let entry = self[entryName] else {
            throw SkinError.fileNotFound(entryName)
        }
        var data = Data()
        _ = try self.extract(entry) { data.append($0) }
        return data
    }

    public func replaceEntry(with name: String, data: Data) throws {
        if let existingEntry = self[name] {
            try self.remove(existingEntry)
        }
        try self.addEntry(with: name, type: .file, uncompressedSize: Int64(data.count)) { position, size in
            return data.subdata(in: Data.Index(position)..<Int(position)+size)
        }
    }
}
