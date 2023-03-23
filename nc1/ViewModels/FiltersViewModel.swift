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
    
    var comicFilter = false
    var monoFilter = false
    var crystalFilter = false
    
    private let context = CIContext()
    private let cameraManager = CameraModel.shared
    
    
}
