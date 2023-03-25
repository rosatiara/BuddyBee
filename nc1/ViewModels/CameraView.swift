//
//  CameraView.swift
//  nc1
//
//  Created by Rosa Tiara Galuh on 21/03/23.
//

import SwiftUI
import AVFoundation
import CoreImage
import UIKit

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
            Text("\(currentDate)")
                .foregroundColor(.black)
                .offset(x: 74, y: -222)
        }.onAppear(perform: {
            camera.check()
        })
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}

struct CameraPreview: UIViewRepresentable {
    @ObservedObject var camera: CameraModel
    let videoDataOutput = AVCaptureVideoDataOutput()
    
    @State var filterIndex = 0
    
    let filters: [Filter] = [
        Filter(name: "None", filter: nil),
        Filter(name: "Sepia", filter: CIFilter(name: "CISepiaTone")),
        Filter(name: "Mono", filter: CIFilter(name: "CIPhotoEffectMono"))
    ]
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: UIScreen.main.bounds)
        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
        camera.preview.frame = view.frame
        view.layer.addSublayer(camera.preview)
        
        
        camera.session.beginConfiguration()
        
        // fetch data output dr preview
        videoDataOutput.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: Int(kCVPixelFormatType_32BGRA)]
        videoDataOutput.alwaysDiscardsLateVideoFrames = true
        videoDataOutput.setSampleBufferDelegate(camera, queue: DispatchQueue(label: "cameraQueue"))
        
        // Add the video data output to the capture session
        if camera.session.canAddOutput(videoDataOutput) {
            camera.session.addOutput(videoDataOutput)
        }
        
        camera.session.commitConfiguration()
        
        camera.session.startRunning()
        
        // modif size camera preview
        camera.preview.videoGravity = .resizeAspectFill
        camera.preview.frame = CGRect(x: 0, y: 0, width: 310, height: 380)
        camera.preview.position = CGPoint(x: view.frame.width / 2, y: view.frame.height / 3.4)
        
        // swipe gestures
        let swipe = UISwipeGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleSwipe(_:)))
        swipe.direction = [.left, .right]
        view.addGestureRecognizer(swipe)
        
        return view
        
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        // No need to update the view when camera or filterIndex changes
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    struct Filter {
        let name: String
        let filter: CIFilter?
    }
    
    
}


                        

                        


