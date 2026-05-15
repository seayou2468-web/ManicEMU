import Foundation
import CoreGraphics

public protocol SkinProtocol {
    var identifier: String { get }
    var name: String { get }

    func screens(for traits: SkinTraits) -> [SkinScreenProtocol]?
    func aspectRatio(for traits: SkinTraits) -> CGSize?
}

public protocol SkinScreenProtocol {
    var inputFrame: CGRect? { get }
    var outputFrame: CGRect? { get }
    var isTouchScreen: Bool { get }
}
