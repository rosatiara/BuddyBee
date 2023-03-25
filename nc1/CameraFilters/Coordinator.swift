import SwiftUI
import UIKit
import CoreImage
import AVFoundation

class Coordinator: NSObject {
    let parent: CameraPreview
    
    init(_ parent: CameraPreview) {
        self.parent = parent
    }
    
    @objc func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
        switch gesture.direction {
        case .left:
            parent.filterIndex = (parent.filterIndex + 1) % parent.filters.count
        case .right:
            parent.filterIndex = (parent.filterIndex + parent.filters.count - 1) % parent.filters.count
        default:
            break
        }
        parent.camera.filter = parent.filters[parent.filterIndex].filter
    }
}
