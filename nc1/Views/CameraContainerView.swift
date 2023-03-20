//
//  CameraContainerView.swift
//  nc1
//
//  Created by Team 1 on 18/03/23.
//

import SwiftUI

struct CameraContainerView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40.0, style: .circular)
                .fill(Color.yellow)
                .frame(width: 327)
            VStack {
                Text("Lorem ipsum....")
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(width: 283, height: 40)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.white).shadow(radius: 3))
                Spacer()
                    .frame(height: 20)
                ZStack {
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 283, height: 384)
                    // CameraFrame()
                    // test
                }
                Spacer()
                    .frame(height:10)
                // SliderButton()
                
                
            }
        }
    }
}

struct CameraContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CameraContainerView()
    }
}
