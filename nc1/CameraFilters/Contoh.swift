/*
 
 struct CameraPreview: UIViewRepresentable {
    @ObservedObject var camera: CameraModel
    
    // Filter list and index
    let filters: [CIFilter] = [
        CIFilter.sepiaTone(),
        CIFilter.photoEffectMono()
    ]
    @State private var filterIndex: Int = 0
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 310, height: 380))
        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
        camera.preview.frame = view.frame
        view.layer.addSublayer(camera.preview)
        
        camera.session.startRunning()
        
        // preview properties
        camera.preview.videoGravity = .resizeAspectFill
        camera.preview.frame = view.bounds
        camera.preview.position = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2)
        
        // Add swipe gesture recognizer
        let swipeLeft = UISwipeGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.swipedLeft))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.swipedRight))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        // Apply current filter to camera preview
        let filter = filters[filterIndex]
        filter.setValue(CIImage(cvPixelBuffer: camera.currentBuffer), forKey: kCIInputImageKey)
        let filteredImage = filter.outputImage
        let context = CIContext(options: nil)
        let cgImage = context.createCGImage(filteredImage!, from: filteredImage!.extent)
        DispatchQueue.main.async {
            camera.preview.contents = cgImage
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(camera: camera, preview: camera.preview, parent: self)
    }
    
    class Coordinator: NSObject {
        let camera: CameraModel
        let preview: AVCaptureVideoPreviewLayer
        let parent: CameraPreview
        
        init(camera: CameraModel, preview: AVCaptureVideoPreviewLayer, parent: CameraPreview) {
            self.camera = camera
            self.preview = preview
            self.parent = parent
        }
        
        @objc func swipedLeft() {
            parent.filterIndex = (parent.filterIndex + 1) % parent.filters.count
        }
        
        @objc func swipedRight() {
            parent.filterIndex = (parent.filterIndex - 1 + parent.filters.count) % parent.filters.count
        }
    }
}
