//
//  ShutterButton.swift
//  nc1
//
//  Created by Rosa Tiara Galuh on 21/03/23.
//

import SwiftUI

struct ShutterButton: View {
    var body: some View {
        Button(action: camera.takePic()) {
            
        } label : {
            ZStack {
                
            }
        }
    }
}

struct ShutterButton_Previews: PreviewProvider {
    static var previews: some View {
        ShutterButton()
    }
}
