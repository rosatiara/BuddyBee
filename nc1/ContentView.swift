//
//  ContentView.swift
//  nc1
//
//  Created by Team 1 on 18/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            LandingPageView()
                .navigationBarTitle("")
        }.accentColor(.black).colorScheme(.light)
      //  FinalView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
