import Foundation
import RealmSwift
import IceCream

public enum SkinType: Int, PersistableEnum {
    case `default`, buildIn, `import`, playcase
}

public class Skin: Object {
    @Persisted(primaryKey: true) public var id: String
    @Persisted public var identifier: String
    @Persisted public var name: String
    @Persisted public var fileName: String
    @Persisted public var gameTypeRawValue: String
    @Persisted public var skinType: SkinType
    @Persisted public var skinData: CreamAsset?
    @Persisted public var isDeleted: Bool = false
    @Persisted public var extras: Data?

    public var gameType: String {
        get { gameTypeRawValue }
        set { gameTypeRawValue = newValue }
    }
}

extension Skin: ObjectUpdatable {
    public static func change(action: ((Realm) throws -> Void)) {
        // App specific implementation usually goes here
    }

    public func getExtra(key: String) -> Any? {
        guard let extras = extras,
              let json = try? JSONSerialization.jsonObject(with: extras) as? [String: Any] else {
            return nil
        }
        return json[key]
    }

    public func updateExtra(key: String, value: Any?) {
        var json = (try? JSONSerialization.jsonObject(with: extras ?? Data()) as? [String: Any]) ?? [:]
        json[key] = value
        extras = try? JSONSerialization.data(withJSONObject: json)
    }
}
