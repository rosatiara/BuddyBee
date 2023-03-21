//
//  CameraPageView.swift
//  nc1
//
//  Created by Rio Johanes Sumolang on 21/03/23.
//

import SwiftUI

struct CameraPageView: View {
    @StateObject var camera = CameraModel()
    var body: some View {
        ZStack {
            Color(0xFEDF3F)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center){
                HStack {
                    Button (action: {
                        // back to LandingPageView()
                    },
                            label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 15, height: 25)
                            .foregroundColor(.black)
                            .padding()
                    })
                    Spacer()
                    Text("Selfie with Johanes Rio")
                        .frame(alignment: .center)
                        .font(.title3)
                        .bold()
                        .foregroundColor(.black)
                    Spacer()
                }
                CameraView()
                ZStack { // Shutter Button
                    Circle()
                        .fill(.black)
                        .frame(width: 120, height: 120)
                    Circle()
                    .fill(.white)
                    .frame(width: 100, height: 100)
                    Button (action: camera.takePic,
                            label: {
                            Image("Bee2")
                                .resizable()
                                .renderingMode(.original)
                    })
                    .frame(width: 60, height: 60)
                }
            }
            
        }
    }
}

struct CameraPageView_Previews: PreviewProvider {
    static var previews: some View {
        CameraPageView()
    }
}


