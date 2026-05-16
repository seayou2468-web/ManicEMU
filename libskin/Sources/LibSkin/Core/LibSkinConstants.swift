import Foundation
import UIKit

public struct LibSkinConstants {
    public struct Path {
        public static var documentsDirectory: URL = {
            return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        }()

        public static var resourceDirectory: URL = documentsDirectory.appendingPathComponent("Resources")
        public static var assetsDirectory: URL = documentsDirectory.appendingPathComponent("Assets")
        public static var tempDirectory: URL = URL(fileURLWithPath: NSTemporaryDirectory())
    }

    public struct NotificationName {
        public static let controllerSkinDidChange = Notification.Name("libSkinControllerSkinDidChange")
    }
}

extension LibSkinConstants {
    public struct DefaultKey {
        public static let FlexSkinFirstTimeGuide = "flexSkinFirstTimeGuide"
    }
    public struct Config {
        public static let DefaultOrientation = UIInterfaceOrientationMask.all
    }
}

extension LibSkinConstants {
    public struct FileExtension {
        public static let manicSkin = "manicskin"
        public static let deltaSkin = "deltaskin"
        public static let gammaSkin = "gammaskin"
    }
}
