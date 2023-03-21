//
//  CameraView.swift
//  nc1
//
//  Created by Rosa Tiara Galuh on 21/03/23.
//

import SwiftUI
import AVFoundation

struct CameraView: View {
    @StateObject var camera = CameraModel()
    var body: some View {
        ZStack {
            CameraPreview(camera: camera)
                .edgesIgnoringSafeArea(.all)
            
        }.onAppear(perform: {
            camera.check()
        })
    }
}


class CameraModel: ObservableObject {
    @Published var isTaken = false
    @Published var session = AVCaptureSession()
    @Published var alert = false
    @Published var output = AVCapturePhotoOutput()
    @Published var preview: AVCaptureVideoPreviewLayer!
    
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
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}

struct CameraPreview: UIViewRepresentable{
    @ObservedObject var camera: CameraModel
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: UIScreen.main.bounds)
        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
        camera.preview.frame = view.frame
        view.layer.addSublayer(camera.preview)
        
        camera.session.startRunning()
        
        // preview properties
        camera.preview.videoGravity = .resizeAspectFill
        return view
        
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

