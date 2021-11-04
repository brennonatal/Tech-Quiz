//
//  ContentView.swift
//  Tech-Quiz
//
//  Created by Brenno Natal on 29/10/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var username: String = ""
    @State private var difficultyIndex = 0
    var difficultyOptions = ["Easy", "Medium",  "Hard"]
    @State var categoryIndex = 0
    var categoryOptions = ["Any Category",
                           "General Knowledge",
                           "Entertainment: Books",
                           "Entertainment: Film",
                           "Entertainment: Music",
                           "Entertainment: Musicals & Theatres",
                           "Entertainment: Television",
                           "Entertainment: Video Games",
                           "Entertainment: Board Games",
                           "Science & Nature",
                           "Science: Computers",
                           "Science: Mathematics",
                           "Mythology",
                           "Sports",
                           "Geography",
                           "History",
                           "Politics",
                           "Art",
                           "Celebrities",
                           "Animals",
                           "Vehicles",
                           "Entertainment: Comics",
                           "Science: Gadgets",
                           "Entertainment: Japanese Anime & Manga",
                           "Entertainment: Cartoon & Animations"]
    
    var body: some View {
        NavigationView { 
            ZStack {
                Form {
                    TextField("Your name", text: $username)
                    
                    Picker(selection: $difficultyIndex, label: Text("Difficulty")) {
                        ForEach(0 ..< difficultyOptions.count) {
                            Text(self.difficultyOptions[$0])
                        }
                        
                    }
                    
                    Picker(selection: $categoryIndex, label: Text("Category")) {
                        ForEach(0 ..< categoryOptions.count) {
                            Text(self.categoryOptions[$0])
                        }
                        .navigationBarTitle("Tech Quiz")
                    }}
                
                Button(action: {
//                    getting questions 
//                    let game = Game(difficulty: difficultyOptions[difficultyIndex], category: categoryIndex)
//                    print(game.questions)
//                    _ = game.getQuestion(number: 0)
                }) {
                    NavigationLink(destination: QuestionsView()) {
                        Text("I'm ready")
                            .font(.largeTitle)
                            .bold()
                    }
                    
                }
                .frame(width: 200, height: 50)
                
                .padding()
                .foregroundColor(.green)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.green, lineWidth: 5)
                )
            }
            .multilineTextAlignment(.center)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}

