//
//  LandingPageView.swift
//  nc1
//
//  Created by Rio Johanes Sumolang on 20/03/23.
//

import SwiftUI

struct LandingPageView: View {
    @State private var isCameraPageActive = false
    var body: some View {
        // test
        ZStack {
            Color(0xFEDF3F)
                .ignoresSafeArea()
            VStack(alignment: .center) {
                Text("Click the bee!")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 40)
                    .foregroundColor(.black)
                ZStack {
                    Circle()
                        .fill(.white)
                        .frame(width: 230, height: 230)
                    
                    NavigationLink(destination: CameraPageView(), isActive: $isCameraPageActive) {
                                        EmptyView()
                                    }
                                    .hidden()
                                    Button(action: {
                                        isCameraPageActive = true
                                    }, label: {
                                        Image("Bee")
                                            .resizable()
                                            .renderingMode(.original)
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
