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
    let emoji = emojis.randomElement()!
    let fontsize: CGFloat = 50.0
    @StateObject var camera = CameraModel()
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [(Color(0xFEDF3F)), (Color(0xFED43F))]), startPoint: .top, endPoint: .bottom)
            //Color(0xFEDF3F)
                .edgesIgnoringSafeArea(.all)
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing){
                    Button(action:{},
                            label:{
                            Image(systemName: "square.and.arrow.down")
                            })
                            Button(action: actionSheet,
                                label:{
                                Image(systemName: "square.and.arrow.up")
                                })
                    }
                }
// ------ INI DIGANTI TEXTFIELD ------
//            VStack(alignment: .center){
//                VStack {
//                    Text("Take a selfie with.. \n ")
//                        .fontWeight(.regular)
//                        .font(.title3)
//                    +
//                    Text(learner)
//                        .fontWeight(.bold)
//                        .font(.title)
//                }.multilineTextAlignment(.center)
//                .foregroundColor(.black)
                ZStack {
                    CameraView()
                    Text(emoji)
                    .font(.system(size: fontsize))
                    .padding()
                }
//
            }
        }
    func actionSheet() {
        guard let urlShare = URL(string:"https://developer.apple.com/xcode/swiftui/")
        else {return }
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let window = windowScene.windows.first {
            let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
            window.rootViewController?.present(activityVC, animated: true, completion: nil)
        }
    }
}

struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            
        }
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


