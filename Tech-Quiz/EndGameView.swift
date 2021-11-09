//
//  EndGameView.swift
//  Tech-Quiz
//
//  Created by Brenno Natal on 08/11/21.
//

import SwiftUI

struct EndGameView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var game: Game
    var body: some View {
        VStack {
            Spacer()
            Text("Your final score is:")
                .font(.title)
            Text("\(self.game.score)")
                .underline()
                .foregroundColor(.red)
                .font(.largeTitle)
            Spacer()
            NavigationLink(destination: StartView(), label: {
                Text("Play again")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.black)
                    .modifier(CustomFrame(height: 100, strokeColor: .green, background: .yellow, opacity: 0.9))
            })
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
    }
}

struct EndGameView_Previews: PreviewProvider {
    static var previews: some View {
        EndGameView()
    }
}
