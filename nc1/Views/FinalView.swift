//
//  FinalView.swift
//  nc1
//
//  Created by Team 1 on 18/03/23.
//

import SwiftUI
import Foundation
import UIKit


struct FinalView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        FinalView()
    }
}

func takeScreenshot(_ sender: Any) {
    guard let windowScene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene,
        let window = windowScene.windows.first(where: { $0.isKeyWindow }) else {
        return
    }
    
    let screenBounds = window.bounds
    let renderer = UIGraphicsImageRenderer(bounds: screenBounds)
    let screenshot = renderer.image { _ in
        window.drawHierarchy(in: screenBounds, afterScreenUpdates: true)
    }
    
    UIImageWriteToSavedPhotosAlbum(screenshot, nil, nil, nil)
}


