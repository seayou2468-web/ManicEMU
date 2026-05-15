import Foundation
import ZIPFoundation
import CoreGraphics

public class SkinManager {
    public static let shared = SkinManager()

    private init() {}

    public func loadSkin(at url: URL) throws -> SkinDocument {
        return try SkinDocument(url: url)
    }

    public func updateFlexSkin(at url: URL, traits: SkinTraits, newScreens: [[String: Any]], touchScreenFrame: CGRect?) throws {
        guard let archive = Archive(url: url, accessMode: .update) else {
            throw SkinError.invalidArchive
        }

        let infoData = try archive.extractData(from: "info.json")

        // Backup if not exists
        if archive["info_flex.json"] == nil {
            try archive.replaceEntry(with: "info_flex.json", data: infoData)
        }

        let infoPath = traits.jsonKeyPath

        var newInfoData = try modifyJSONData(infoData, keyPath: infoPath + ["screens"], newValue: newScreens)

        if let touchScreenFrame, var items = try getValueFromJSON(newInfoData, keyPath: infoPath + ["items"]) as? [[String: Any]] {
            items.removeAll { item in
                if let inputs = item["inputs"] as? [String: String], inputs["x"] == "touchScreenX", inputs["y"] == "touchScreenY" {
                    return true
                }
                return false
            }

            let frameDict: [String: CGFloat] = [
                "x": touchScreenFrame.origin.x,
                "y": touchScreenFrame.origin.y,
                "width": touchScreenFrame.width,
                "height": touchScreenFrame.height
            ]

            let inputs = ["x": "touchScreenX", "y": "touchScreenY"]
            let newItem: [String: Any] = ["frame": frameDict, "inputs": inputs]
            items.append(newItem)

            newInfoData = try modifyJSONData(newInfoData, keyPath: infoPath + ["items"], newValue: items)
        }

        try archive.replaceEntry(with: "info.json", data: newInfoData)
    }

    // JSON Utilities
    public func modifyJSONData(_ jsonData: Data, keyPath: [String], newValue: Any) throws -> Data {
        guard var jsonObject = try JSONSerialization.jsonObject(with: jsonData) as? [String: Any] else {
            throw SkinError.invalidJson
        }

        func modify(object: inout [String: Any], keys: ArraySlice<String>, newValue: Any) {
            guard let key = keys.first else { return }
            if keys.count == 1 {
                object[key] = newValue
            } else if var nested = object[key] as? [String: Any] {
                modify(object: &nested, keys: keys.dropFirst(), newValue: newValue)
                object[key] = nested
            }
        }

        modify(object: &jsonObject, keys: keyPath[...], newValue: newValue)
        return try JSONSerialization.data(withJSONObject: jsonObject, options: [])
    }

    public func getValueFromJSON(_ jsonData: Data, keyPath: [String]) throws -> Any? {
        guard let jsonObject = try JSONSerialization.jsonObject(with: jsonData) as? [String: Any] else {
            throw SkinError.invalidJson
        }
        var current: Any = jsonObject
        for key in keyPath {
            if let dict = current as? [String: Any], let next = dict[key] {
                current = next
            } else {
                return nil
            }
        }
        return current
    }
}

public enum SkinError: Error {
    case invalidArchive
    case missingInfoJson
    case invalidJson
    case fileNotFound(String)
    case fileAlreadyExists
}
