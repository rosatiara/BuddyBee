import SwiftUI
import Foundation
import AVFoundation
import DataField
import UIKit


struct FinalView: View {
    // caption & emoji
    private let characterLimit = 30 // batasin jumlah karakter caption
    let emoji: String
    let fontsize: CGFloat = 50.0
    
    // hasil foto
    @ObservedObject var camera = CameraModel()
    @State private var capturedImage: Image?
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [(Color(0xFEDF3F)), (Color(0xFED43F))]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
//                .toolbar {
//                    ToolbarItemGroup(placement: .navigationBarTrailing){
//                        Button(action:takeScreenshot,
//                               label:{
//                            Image(systemName: "square.and.arrow.down")
//                        })
//                        Button(action: actionSheet,
//                               label:{
//                            Image(systemName: "square.and.arrow.up")
//                        })
//                    }
//                }
            //
            ScrollView {
                ScrollViewReader { scrollView in
                    VStack {
//                        TextField("Write honey-like buzz-words!", text: $caption)//{ text in text.count < 30 }
//                            .padding()
//                            .padding(.leading, 30)
//                            .frame(alignment: .center)
                        ZStack {
                            Rectangle() // polaroid
                                .colorInvert()
                                .background(Color.white)
                                .frame(width: 350, height: 497)
                                .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.15),
                                        radius: 2,
                                        x: 4,
                                        y: 4)
                                .shadow(color: .white, radius: 2, x: -1, y: -1)
                            if let image = capturedImage { // hasil foto
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 300, height: 300)
                                    .border(.red)
                            } else {
                                Text("nooooooooo iiiiiimmaaaageee")
                            }
                            Text(emoji)
                                .font(.system(size: fontsize))
                                .padding()
                        }
                        LottieView(lottieFile: "lottiebee")
                            .frame(width: 200, height: 200)
                            .offset(y: -22)
                    }
                }
            }
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

struct ImageView: View {
    @State var image: UIImage?
    
    var body: some View {
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else {
                Text("No Image")
            }
        }
    }
}

