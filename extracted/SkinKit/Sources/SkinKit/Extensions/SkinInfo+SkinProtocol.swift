import Foundation
import CoreGraphics

extension SkinInfo: SkinProtocol {
    public func screens(for traits: SkinTraits) -> [SkinScreenProtocol]? {
        return getOrientationInfo(for: traits)?.screens
    }

    public func aspectRatio(for traits: SkinTraits) -> CGSize? {
        return getOrientationInfo(for: traits)?.aspectRatio
    }

    private func getOrientationInfo(for traits: SkinTraits) -> Representations.DeviceInfo.OrientationInfo? {
        let deviceInfo: Representations.DeviceInfo?
        switch traits.device {
        case .iphone: deviceInfo = representations?.iphone
        case .ipad: deviceInfo = representations?.ipad
        }
        return traits.orientation == .portrait ? deviceInfo?.portrait : deviceInfo?.landscape
    }
}

extension SkinInfo.Representations.DeviceInfo.OrientationInfo.Screen: SkinScreenProtocol {
    public var inputFrame: CGRect? { self.inputFrame?.cgRect }
    public var outputFrame: CGRect? { self.outputFrame?.cgRect }
    public var isTouchScreen: Bool {
        return self.isTouchScreen ?? false
    }
}
