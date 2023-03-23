//
//  ConfettiView.swift
//  nc1
//
//  Created by Rosa Tiara Galuh on 23/03/23.
//

import SwiftUI

struct ConfettiView: UIViewRepresentable {
    @Binding var isConfettiAnimating: Bool
    
    func makeUIView(context: Context) -> UIView {
        return UIView()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        if !isConfettiAnimating {
            return
        }
        
        let emitter = CAEmitterLayer()
        emitter.emitterPosition = CGPoint(x: uiView.frame.width/2, y: 0)
        emitter.emitterShape = .line
        emitter.emitterSize = CGSize(width: uiView.frame.width, height: 1)
        emitter.birthRate = 2
        
        let confetti = makeConfetti()
        emitter.emitterCells = [confetti]
        
        uiView.layer.addSublayer(emitter)
        isConfettiAnimating = false
    }
    
    func makeConfetti() -> CAEmitterCell {
        let confetti = CAEmitterCell()
        confetti.birthRate = 10
        confetti.lifetime = 5.0
        confetti.lifetimeRange = 0
        confetti.velocity = CGFloat(200.0)
        confetti.velocityRange = CGFloat(50.0)
        confetti.emissionLongitude = CGFloat(Double.pi)
        confetti.emissionRange = CGFloat(Double.pi)
        confetti.spin = CGFloat(3.5)
        confetti.spinRange = CGFloat(1.0)
        confetti.scaleRange = CGFloat(0.5)
        confetti.contents = UIImage(named: "confetti")!.cgImage
        
        return confetti
    }
}
 

extension UIColor {
    static var random: UIColor {
        let red = CGFloat(arc4random_uniform(255))/255
        let green = CGFloat(arc4random_uniform(255))/255
        let blue = CGFloat(arc4random_uniform(255))/255
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
}



//struct ConfettiView_Previews: PreviewProvider {
//    static var previews: some View {
//        ConfettiView()
//    }
//}
