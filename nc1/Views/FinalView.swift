import SwiftUI
import Foundation
import AVFoundation
import DataField
import UIKit


struct FinalView: View {
    @State private var caption = ""
    private let characterLimit = 30 // batasin jumlah karakter caption
    let emoji: String
    let fontsize: CGFloat = 50.0
    @State var image: UIImage?
    @StateObject var camera = CameraModel()
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [(Color(0xFEDF3F)), (Color(0xFED43F))]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing){
                        Button(action:takeScreenshot,
                               label:{
                            Image(systemName: "square.and.arrow.down")
                        })
                        Button(action: actionSheet,
                               label:{
                            Image(systemName: "square.and.arrow.up")
                        })
                    }
                }
            //
                    VStack {
                        TextField("Write honey-like buzz-words!", text: $caption)//{ text in text.count < 30 }
                            .padding()
                            .padding(.leading, 30)
                            .frame(alignment: .center)
                        ZStack {
                            // polaroid
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
                            if let image = camera.image { // hasil foto
                                Image(uiImage: image)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 300, height: 300)
                                                .border(.red)
                            }
                            Text(emoji)
                                .font(.system(size: fontsize))
                                .padding()
                        }
                        LottieView(lottieFile: "lottiebee")
                            .frame(width: 200, height: 200)
                            .offset(y: -22)
                    }
//                }
//            }
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


func takeScreenshot() {
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


    
//func takeScreenshotAndSave() {
//
//    guard let scene = UIApplication.shared.connectedScenes.first else {
//        return
//    }
//
//    guard let window = (scene as? UIWindowScene)?.windows.first else {
//        return
//    }
//
//    UIGraphicsBeginImageContextWithOptions(window.bounds.size, false, 0.0)
//
//    window.drawHierarchy(in: window.bounds, afterScreenUpdates: true)
//
//    guard let screenshot = UIGraphicsGetImageFromCurrentImageContext() else {
//        return
//    }
//    UIGraphicsEndImageContext()
//
//    UIImageWriteToSavedPhotosAlbum(screenshot, nil, nil, nil)
//}


struct ImageView: View {
    var image: Image
    var body: some View {
        VStack {
            image
                .resizable()
                .scaledToFit()
        }
    }
}

