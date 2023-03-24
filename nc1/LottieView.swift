import SwiftUI
import Lottie
 
struct LottieView: UIViewRepresentable {
    let animationView = LottieAnimationView()
    let lottieFile: String
 
    func makeUIView(context: UIViewRepresentableContext<LottieView>) ->  UIView {
        let view = UIView(frame: .zero)
        
        let animation = LottieAnimation.named(lottieFile)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 1.0
        animationView.play()
 
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
 
        NSLayoutConstraint.activate([
        animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
        animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        return view
    }
 
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
    }
}
