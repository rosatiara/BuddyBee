//
//  CameraModel.swift
//  nc1
//
//  Created by Rosa Tiara Galuh on 24/03/23.
//

import SwiftUI
import AVFoundation
import CoreImage
import UIKit

class CameraModel: NSObject, ObservableObject, AVCapturePhotoCaptureDelegate, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    @Published var capturedImage: Image?
    @Published var uiImage: UIImage? // add this variable to hold the captured image as UIImage
    
    var completionHandler: ((UIImage?) -> Void)?
    
    static let shared = CameraModel()
    @Published var error: CameraError?
    @Published var isTaken = false
    @Published var session = AVCaptureSession()
    @Published var alert = false
    @Published var output = AVCapturePhotoOutput()
    @Published var preview: AVCaptureVideoPreviewLayer!
    private let sessionQueue = DispatchQueue(label: "sessionQueue")
    
    @Published var filter: CIFilter?
    @Published var selectedFilterIndex = 0
    
    override init() {
        super.init()
        self.capturedImage = capturedImage
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
            self.session.stopRunning()

            DispatchQueue.global(qos: .userInitiated).async {
                withAnimation {self.isTaken.toggle()}
            }
            
        }
    }
    
    // Produce photo output
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let error = error {
            print("Error capturing photo: \(error.localizedDescription)")
            self.completionHandler?(nil)
            return
        }
        
        guard let imageData = photo.fileDataRepresentation() else {
            print("Error extracting image data from photo")
            self.completionHandler?(nil)
            return
        }
        
        guard let image = UIImage(data: imageData) else {
            print("Error converting image data to UIImage")
            self.completionHandler?(nil)
            return
        }
        
        print("Picture taken!")
                self.capturedImage = Image(uiImage: image)
                self.uiImage = image // store the captured image as UIImage
                self.completionHandler?(image)
    }





    
    // Filters
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
            return
        }
        
        var ciImage = CIImage(cvPixelBuffer: pixelBuffer)
        
        // Apply filter if there is one
        if let filter = filter {
            filter.setValue(ciImage, forKey: kCIInputImageKey)
            guard let outputImage = filter.outputImage else {
                return
            }
            ciImage = outputImage
        }
        
        guard let cgImage = CIContext().createCGImage(ciImage, from: ciImage.extent) else {
            return
        }
    }
    
}

