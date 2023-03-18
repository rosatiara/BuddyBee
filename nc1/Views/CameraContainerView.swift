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
                .frame(width: 360)
            VStack {
                // command
                // camera frame goes here
                // slider button
            }
        }
    }
}

struct CameraContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CameraContainerView()
    }
}
