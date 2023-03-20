//
//  LandingPageView.swift
//  nc1
//
//  Created by Rio Johanes Sumolang on 20/03/23.
//

import SwiftUI

struct LandingPageView: View {
    var body: some View {
        ZStack {
            Color(0xFEDF3F)
                .ignoresSafeArea()
            VStack(alignment: .center) {
                Text("Click the bee!")
                    .font(.largeTitle)
                .bold()
                .padding(.bottom, 40)
                ZStack {
                    Circle()
                        .fill(.white)
                        .frame(width: 230, height: 230)
                    Button(action: {
                        
                    }, label: {
                        Image("Image")
                            .resizable()
                            .renderingMode(.original)
                    })
                    .frame(width: 230, height: 200)
                    
                }
                Text("To find your **selfie** \n**buddy** and **emoji**")
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
