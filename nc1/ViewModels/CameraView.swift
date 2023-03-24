//
//  CameraView.swift
//  nc1
//
//  Created by Rosa Tiara Galuh on 21/03/23.
//

import SwiftUI
import AVFoundation
import CoreImage

struct CameraView: View {
    var currentDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: Date())
    }
    
    @StateObject var camera = CameraModel()
 
    var body: some View {
        ZStack {
            Rectangle()
                .colorInvert()
                .background(Color.white)
                .frame(width: 350, height: 497)
                .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.15),
                        radius: 2,
                        x: 4,
                        y: 4)
                .shadow(color: .white, radius: 2, x: -1, y: -1)
            
            CameraPreview(camera: camera)
//            Image("Bee")
//                .resizable()
//                .frame(width: 200, height: 180)
//                .offset(x:30)
            Text("\(currentDate)")
                .foregroundColor(.black)
                .offset(x: 74, y: -222)
        }.onAppear(perform: {
            camera.check()
        })
    }
}


class CameraModel: NSObject, ObservableObject, AVCapturePhotoCaptureDelegate {
    
    @Published var isTaken = false
    @Published var session = AVCaptureSession()
    @Published var alert = false
    @Published var output = AVCapturePhotoOutput()
    @Published var preview: AVCaptureVideoPreviewLayer!
    private let sessionQueue = DispatchQueue(label: "sessionQueue")
    
    static let shared = CameraModel()
    
    override init() {
        super.init()
        check()
        sessionQueue.async { [unowned self] in
            self.setUp()
            self.session.startRunning()
        }
    }
    
    // Check camera status
    func check() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            setUp()
            return
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { status in
                if status {
                    self.setUp()
                } 
            }
        case .denied:
            self.alert.toggle()
            return
        default:
            return
        }
    }
    
    // Setup camera..
    func setUp() {
        do {
            self.session.beginConfiguration()
        
            // set device & camera to front
            let device =  AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
            
            let input = try AVCaptureDeviceInput(device: device!)
            
            if self.session.canAddInput(input) {
                self.session.addInput(input)
            }
            
            if self.session.canAddOutput(self.output) {
                self.session.addOutput(self.output)
            }
            
            self.session.commitConfiguration()
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // Take picture...
    func takePic() {
        DispatchQueue.global(qos: .background).async {
            self.session.startRunning()
            self.output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
            //self.session.stopRunning()

            DispatchQueue.global(qos: .userInitiated).async {
                withAnimation {self.isTaken.toggle()}
            }
            
        }
    }
    
    // Produce photo output
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo:AVCapturePhoto, error: Error?) {
        if error != nil {
            return
        }
        print("Picture taken!")
    }
    

}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}

struct CameraPreview: UIViewRepresentable {
    @ObservedObject var camera: CameraModel
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: UIScreen.main.bounds)
        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
        camera.preview.frame = view.frame
        view.layer.addSublayer(camera.preview)
        
        camera.session.startRunning()
        
        // preview properties
        camera.preview.videoGravity = .resizeAspectFill
        camera.preview.frame = CGRect(x: 0, y: 0, width: 310, height: 380)
        camera.preview.position = CGPoint(x: view.frame.width / 2, y: view.frame.height / 3.4)

        return view
        
    }
    

    
    func updateUIView(_ uiView: UIViewType, context: Context) {

    }
}
                        

                        


