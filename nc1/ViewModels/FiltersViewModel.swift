//
//  FiltersViewModel.swift
//  nc1
//
//  Created by Rosa Tiara Galuh on 23/03/23.
//

import CoreImage

class FiltersViewModel: ObservableObject {
    @Published var error: Error?
    @Published var frame: CGImage?
    
    var sepiaFilter = false
    var colorInvertFilter = false
    var monoFilter = false
    var colorMapFilter = false
    var instantFilter = false
    var monochromeFilter = false
    
    
    // FrameManager = CameraPreview
    // CameraManager = CameraModel
    
    
    private let context = CIContext()
    private let cameraModel = CameraModel.shared
    
    
    

    
    
}
