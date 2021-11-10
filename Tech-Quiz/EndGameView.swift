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
                .font(Font.custom("Orbitron", size: 30))
            Text("\(self.game.score)")
                .underline()
                .foregroundColor(.red)
                .font(Font.custom("Orbitron", size: 30))
            Spacer()
            NavigationLink(destination: StartView(), label: {
                Text("Play again")
                    .font(Font.custom("Orbitron", size: 30))
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
