//
//  FilterControlView.swift
//  nc1
//
//  Created by Rosa Tiara Galuh on 23/03/23.
//

import SwiftUI

struct FilterControlView: View {
    /**
     1. CISepiaTone
     2. CIColorInvert
     3. CIColorMap
     4. CIPhotoEffectInstant
     5. CIColorMonochrome
     */
    
    @Binding var sepiaSelected: Bool
    @Binding var colorInvertSelected: Bool
    @Binding var monoSelected: Bool // bnw
    @Binding var colorMapSelected: Bool
    @Binding var instantSelected: Bool
    @Binding var monochromeSelected: Bool // one color, bukan bnw
    
    var body: some View {
        VStack {
          Spacer()

          HStack(spacing: 12) {
            ToggleFilterBtn(selected: $sepiaSelected, label: "sepia")
            ToggleFilterBtn(selected: $colorInvertSelected, label: "invert")
            ToggleFilterBtn(selected: $monoSelected, label: "mono")
            ToggleFilterBtn(selected: $colorMapSelected, label: "colormap")
            ToggleFilterBtn(selected: $monochromeSelected, label: "monochrome")
          }
        }
    }
}

struct FilterControlView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.yellow.edgesIgnoringSafeArea(.all)
            FilterControlView(
            sepiaSelected: .constant(false),
            colorInvertSelected: .constant(false),
            monoSelected: .constant(false),
            colorMapSelected: .constant(false),
            instantSelected: .constant(false),
            monochromeSelected: .constant(false)
            )
        }
    }
}
