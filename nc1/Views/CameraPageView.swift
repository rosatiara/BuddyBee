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
                .ignoresSafeArea()
            VStack(alignment: .center){
                HStack {
                    Button (action: {
                        
                    },
                            label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 12, height: 24)
                            .foregroundColor(.blue)
                            .padding()
                    })
                    Spacer()
                    Button (action: {
                        
                    },
                            label: {
                        Image(systemName: "square.and.arrow.up")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.blue)
                            .padding()
                    })
                }
                Text("Selfie with\n**Nama Orang**")
                    .font(.title)

                Image(systemName: "heart") // camera here
                    .resizable()
                    .frame(width: 320, height: 500)
                    .padding()
                
                ZStack {
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
