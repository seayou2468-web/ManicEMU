import Foundation

private class BundleFinder {}

extension Bundle {
    public static var libSkin: Bundle = {
        let bundleName = "LibSkin_LibSkin"
        let candidates = [
            Bundle.main.resourceURL,
            Bundle(for: BundleFinder.self).resourceURL,
            Bundle.main.bundleURL,
            Bundle(for: BundleFinder.self).resourceURL?.deletingLastPathComponent(),
            Bundle(for: BundleFinder.self).resourceURL?.appendingPathComponent(bundleName + ".bundle")
        ]

        for candidate in candidates {
            let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }

        return Bundle(for: BundleFinder.self)
    }()

    public static func libSkinLocalizedString(forKey key: String) -> String {
        return NSLocalizedString(key, bundle: .libSkin, comment: "")
    }
}
