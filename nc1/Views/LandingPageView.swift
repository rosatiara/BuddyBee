//
//  LandingPageView.swift
//  nc1
//
//  Created by Rio Johanes Sumolang on 20/03/23.
//

import SwiftUI

struct LandingPageView: View {
    @State private var isCameraPageActive = false
    var confettiView: ConfettiView!
    var body: some View {
        // test
        ZStack {
            LinearGradient(gradient: Gradient(colors: [(Color(0xFEDF3F)), (Color(0xFED43F))]), startPoint: .top, endPoint: .bottom)
            // Color(0xFEDF3F)
                .ignoresSafeArea()
            VStack(alignment: .center) {
                Text("Poke the bee!")
                    .font(.system(size:40))
                    .bold()
                    .padding(.bottom, 40)
                    .foregroundColor(.black)
                ZStack {
                    //Circle()
                    //.fill(.white)
                    //.frame(width: 230, height: 230)
                    
                    NavigationLink(destination: CameraPageView(), isActive: $isCameraPageActive) {
                        EmptyView()
                    }
                    .hidden()
                    Button(action: {
                        isCameraPageActive = true
                    }, label: {
                        LottieView(lottieFile: "lottiebee")
                            .frame(width: 350, height: 350)
                    })
                    .frame(width: 230, height: 200)
                    
                }
                Text("To find your **selfie** \n**buddy** and **emoji**")
                    .foregroundColor(.black)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding(.top, 40)
            }
        }
    }
}

struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView()
    }
}

extension Color {
  init(_ hex: UInt, alpha: Double = 1) {
    self.init(
      .sRGB,
      red: Double((hex >> 16) & 0xFF) / 255,
      green: Double((hex >> 8) & 0xFF) / 255,
      blue: Double(hex & 0xFF) / 255,
      opacity: alpha
    )
  }
}
