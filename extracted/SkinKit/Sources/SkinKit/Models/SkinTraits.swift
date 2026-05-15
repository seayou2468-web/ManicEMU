import Foundation

public struct SkinTraits {
    public enum Device { case iphone, ipad }
    public enum DisplayType { case standard, edgeToEdge }
    public enum Orientation { case portrait, landscape }

    public var device: Device
    public var displayType: DisplayType
    public var orientation: Orientation

    public init(device: Device, displayType: DisplayType, orientation: Orientation) {
        self.device = device
        self.displayType = displayType
        self.orientation = orientation
    }

    public var jsonKeyPath: [String] {
        return [
            "representations",
            device == .iphone ? "iphone" : "ipad",
            displayType == .standard ? "standard" : "edgeToEdge",
            orientation == .portrait ? "portrait" : "landscape"
        ]
    }
}
