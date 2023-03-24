//
//  FrameManager.swift
//  nc1
//
//  Created by Rosa Tiara Galuh on 24/03/23.
//

import AVFoundation

class FrameManager: NSObject, ObservableObject {
  static let shared = FrameManager()

  @Published var current: CVPixelBuffer? // get currentpixelbuffer

  let videoOutputQueue = DispatchQueue(
    label: "videoOutputQueue",
    qos: .userInitiated,
    attributes: [],
    autoreleaseFrequency: .workItem)

  private override init() {
    super.init()

    CameraModel.shared.setUp()
  }
}

extension FrameManager: AVCaptureVideoDataOutputSampleBufferDelegate {
  func captureOutput(
    _ output: AVCaptureOutput,
    didOutput sampleBuffer: CMSampleBuffer,
    from connection: AVCaptureConnection
  ) {
    if let buffer = sampleBuffer.imageBuffer {
      DispatchQueue.main.async {
        self.current = buffer
      }
    }
  }
}
