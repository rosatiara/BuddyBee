//
//  CameraPageView.swift
//  nc1
//
//  Created by Rio Johanes Sumolang on 21/03/23.
//

import SwiftUI

struct CameraPageView: View {
    var body: some View {
        ZStack {
            Color(0xFEDF3F)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center){
                HStack {
                    Button (action: {
                        // back to random name
                    },
                            label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 15, height: 25)
                            .foregroundColor(.black)
                            .padding()
                    })
                    Spacer()
                    Text("Selfie with\nJohanes Rio")
                        .multilineTextAlignment(.center)
                        .font(.title3)
                        .foregroundColor(.black)
                    Spacer()
                    Button (action: {
                        
                    },
                            label: {
                        Image(systemName: "square.and.arrow.up")
                            .resizable()
                            .frame(width: 20, height: 24)
                            .foregroundColor(.black)
                            .padding()
                    })
                }
                CameraView()
                ZStack { // Shutter Button
                    Circle()
                        .fill(.black)
                        .frame(width: 120, height: 120)
                    Circle()
                    .fill(.white)
                    .frame(width: 100, height: 100)
                    Button (action: {
                       
                    },
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
