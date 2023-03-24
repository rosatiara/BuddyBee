//
//  ToggleFilterBtn.swift
//  nc1
//
//  Created by Rosa Tiara Galuh on 23/03/23.
//

// Buttons for filters

import SwiftUI

struct ToggleFilterBtn: View {
    @Binding var selected: Bool
    @State var sfSymbol = "circle.hexagongrid.circle"
    
    var label: String
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: 40, height: 40)
            Button(action: {
                selected.toggle()
            }, label: {
                Image(systemName: sfSymbol) // flame.circle, tropicalstorm.circle, diamond.circle
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.yellow)

            })
            .foregroundColor(selected ? .white : .black)
            .animation(.easeInOut, value: 0.25)
            .cornerRadius(10)
        }
        
    }
    
    struct ToggleFilterBtn_Previews: PreviewProvider {
        static var previews: some View {
            ZStack {
                Color.yellow.edgesIgnoringSafeArea(.all)
                ToggleFilterBtn(selected: .constant(false), label: "a")
            }
        }
    }
}
