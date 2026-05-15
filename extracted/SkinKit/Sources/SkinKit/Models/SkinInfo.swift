import Foundation
import CoreGraphics

public struct SkinInfo: Codable {
    public let identifier: String
    public let name: String
    public let gameType: String?
    public let debug: Bool?

    public struct Representations: Codable {
        public struct DeviceInfo: Codable {
            public struct OrientationInfo: Codable {
                public struct Screen: Codable {
                    public let inputFrame: Frame?
                    public let outputFrame: Frame?
                    public let isTouchScreen: Bool?
                }

                public struct Item: Codable {
                    public let frame: Frame
                    public let inputs: [String: String]?
                    public let type: String?
                }

                public let assets: [String: String]?
                public let screens: [Screen]?
                public let items: [Item]?
                public let aspectRatio: CGSize?
            }

            public let portrait: OrientationInfo?
            public let landscape: OrientationInfo?
        }

        public let iphone: DeviceInfo?
        public let ipad: DeviceInfo?
        public let tv: DeviceInfo?
    }

    public let representations: Representations?

    public struct Frame: Codable {
        public let x: CGFloat
        public let y: CGFloat
        public let width: CGFloat
        public let height: CGFloat

        public var cgRect: CGRect {
            return CGRect(x: x, y: y, width: width, height: height)
        }
    }
}
