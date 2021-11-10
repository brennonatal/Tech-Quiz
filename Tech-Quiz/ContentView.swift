//
//  ContentView.swift
//  Tech-Quiz
//
//  Created by Brenno Natal on 29/10/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var game: Game
    @State private var splashTime = 3.3675542//this is a magic number !
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var showStartView = false
    var body: some View {
        
        Group{
            if showStartView{
                StartView()
            } else {
                SplashView()
            }
        }.animation(.linear(duration: 1.34), value: showStartView)
        .onReceive(timer) { time in
            if self.splashTime > 0 {
                self.splashTime -= 1
                 
            } else {
                showStartView = true
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
            .preferredColorScheme(.light)
    }
}


