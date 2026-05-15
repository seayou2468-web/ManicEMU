import Foundation
import CoreGraphics
import AVFoundation

extension SkinProtocol {
    public func getFrames(traits: SkinTraits, bounds: CGRect, scale: CGFloat = 1) -> (skinFrame: CGRect, mainGameViewFrame: CGRect, touchGameViewFrame: CGRect?)? {
        guard let aspectRatio = self.aspectRatio(for: traits) else { return nil }

        var skinFrame = AVMakeRect(aspectRatio: aspectRatio, insideRect: bounds).rounded()
        if scale != 1 {
            skinFrame = skinFrame.applying(CGAffineTransform(scaleX: scale, y: scale))
        }

        var mainGameViewFrame: CGRect = .zero
        var touchGameViewFrame: CGRect? = nil

        if let screens = self.screens(for: traits) {
            for screen in screens {
                if let outputFrame = screen.outputFrame {
                    let frame = outputFrame.applying(.init(scaleX: skinFrame.width, y: skinFrame.height)).rounded()
                    if screen.isTouchScreen {
                        touchGameViewFrame = frame
                    } else {
                        mainGameViewFrame = frame
                    }
                }
            }
        }

        return (skinFrame, mainGameViewFrame, touchGameViewFrame)
    }
}

extension CGRect {
    func rounded() -> CGRect {
        return CGRect(x: round(origin.x), y: round(origin.y), width: round(size.width), height: round(size.height))
    }
}
