import UIKit

extension UIDevice {
    public static var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }

    public static var isLandscape: Bool {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.windows.first?.windowScene?.interfaceOrientation.isLandscape ?? false
        } else {
            return UIApplication.shared.statusBarOrientation.isLandscape
        }
    }
}
