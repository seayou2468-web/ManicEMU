import Foundation
import RealmSwift

public protocol ObjectUpdatable {
    static func change(action: ((_ realm: Realm) throws ->Void))
    func getExtra(key: String) -> Any?
    func updateExtra(key: String, value: Any?)
}
