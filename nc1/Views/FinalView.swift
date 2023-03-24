import SwiftUI
import Foundation
import AVFoundation


struct FinalView: View {
    @State private var caption = ""
    var currentDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: Date())
    }
//    @StateObject var camera = CameraModel()
    //@StateObject var camera = CameraModel()
    //@Binding var output = AVCapturePhotoOutput()
    var body: some View {
        ZStack {
            Color(0xFEDF3F)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center){
                Button(action: takeScreenshotAndSave)
                {
                    Image(systemName: "square.and.arrow.down")
                        .foregroundColor(.black)
                }
                ZStack{
                    Rectangle()
                        .colorInvert()
                        .background(Color.white)
                        .frame(width: 350, height: 497)
                        .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.15),
                                radius: 2,
                                x: 4,
                                y: 4)
                        .shadow(color: .white, radius: 2, x: -1, y: -1)
                    VStack{
                        HStack {
                            TextField("edit caption", text: $caption)
                                .padding()
                                .padding()
                                .padding()
                        }
                        //CameraView()
                        Spacer()
                            .frame(height: 300)
                        Text("\(currentDate)")
                                .foregroundColor(.black)
//                              .offset(x: 60, y: -227)
                        }
                        Spacer()
                            .frame(height: 400)
                    }
                    
                    //CameraView()
                }
                Spacer()
            }
            Spacer()
            }
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
import SwiftUI

struct TextFieldWrapper: UIViewRepresentable {

    @Binding var text: String

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.delegate = context.coordinator
        return textField
    }

    func updateUIView(_ textField: UITextField, context: Context) {
        textField.text = text
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UITextFieldDelegate {

        var parent: TextFieldWrapper

        init(_ textFieldWrapper: TextFieldWrapper) {
            self.parent = textFieldWrapper
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            parent.text = textField.text ?? ""
        }

    }
}

    

//add to info.plist fileprivate<key>NSPhotoLibraryAddUsageDescription</key>
//<string>Save screenshots to the Photos library</string>
