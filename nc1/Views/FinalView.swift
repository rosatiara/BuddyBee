import SwiftUI
import Foundation
import AVFoundation
import DataField


struct FinalView: View {
    @State private var caption = ""
    private let characterLimit = 30 // batasin jumlah karakter caption
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
                        Button(action:takeScreenshotAndSave,
                                label:{
                                Image(systemName: "square.and.arrow.down")
                                })
                                Button(action: actionSheet,
                                    label:{
                                    Image(systemName: "square.and.arrow.up")
                                    })
                        }
                    }
                DataField("Write your buddy-bee honey-like buzz-words", data: $caption) { text in text.count < 30 }
//                TextField("Write your buddy-bee honey-like buzz-words", text: $caption)
                    .padding()
                    ZStack {
                        CameraView()
                        Text(emoji)
                        .font(.system(size: fontsize))
                        .padding()
                    }
                LottieView(lottieFile: "lottiebee")
                    .frame(width: 50, height: 50)
    // -- Tambahin gambar bee lottie di sini ----
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

    
struct FinalView_Previews: PreviewProvider {
        static var previews: some View {
            FinalView()
        }
    }
    
func takeScreenshotAndSave() {
        // Get the current scene
        guard let scene = UIApplication.shared.connectedScenes.first else {
            return
        }
        
        // Get the window for the scene
        guard let window = (scene as? UIWindowScene)?.windows.first else {
            return
        }
        
        // Begin the graphics context
        UIGraphicsBeginImageContextWithOptions(window.bounds.size, false, 0.0)
        
        // Render the window into the graphics context
        window.drawHierarchy(in: window.bounds, afterScreenUpdates: true)
        
        // Get the screenshot as an image
        guard let screenshot = UIGraphicsGetImageFromCurrentImageContext() else {
            return
        }
        
        // End the graphics context
        UIGraphicsEndImageContext()
        
        // Save the screenshot to the Photos library
        UIImageWriteToSavedPhotosAlbum(screenshot, nil, nil, nil)
    }


//struct TextFieldWrapper: UIViewRepresentable {
//
//    @Binding var text: String
//
//    func makeUIView(context: Context) -> UITextField {
//        let textField = UITextField(frame: .zero)
//        textField.borderStyle = .roundedRect
//        textField.font = UIFont.systemFont(ofSize: 15)
//        textField.delegate = context.coordinator
//        return textField
//    }
//
//    func updateUIView(_ textField: UITextField, context: Context) {
//        textField.text = text
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    class Coordinator: NSObject, UITextFieldDelegate {
//
//        var parent: TextFieldWrapper
//
//        init(_ textFieldWrapper: TextFieldWrapper) {
//            self.parent = textFieldWrapper
//        }
//
//        func textFieldDidChangeSelection(_ textField: UITextField) {
//            parent.text = textField.text ?? ""
//        }
//
//    }
//}

    

//add to info.plist fileprivate<key>NSPhotoLibraryAddUsageDescription</key>
//<string>Save screenshots to the Photos library</string>
