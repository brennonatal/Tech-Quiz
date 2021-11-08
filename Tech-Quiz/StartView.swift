//
//  StartView.swift
//  Tech-Quiz
//
//  Created by Vitor Hugo Costa on 11/3/21.
//

import SwiftUI

struct StartView: View {
    @StateObject var game = Game(difficulty: "easy", category: 0)
    
    @State var username: String = ""
    @State var difficultyIndex = 0
    var difficultyOptions = ["Easy", "Medium",  "Hard"]
    var difficultyColor: [Color] = [.green, .orange, .red]
    @State var colors: Color = .mint
    @State var categoryIndex = 0
    var categoryOptions = ["Any Category", "General Knowledge",
                           "Entertainment: Books", "Entertainment: Film",
                           "Entertainment: Music", "Entertainment: Musicals & Theatres",
                           "Entertainment: Television", "Entertainment: Video Games",
                           "Entertainment: Board Games", "Science & Nature",
                           "Science: Computers", "Science: Mathematics",
                           "Mythology", "Sports", "Geography",
                           "History", "Politics", "Art",
                           "Celebrities", "Animals",
                           "Vehicles", "Entertainment: Comics",
                           "Science: Gadgets",
                           "Entertainment: Japanese Anime & Manga",
                           "Entertainment: Cartoon & Animations"]
    
    var body: some View {
        NavigationView {
            VStack {
                Picker(selection: $difficultyIndex, label: Text("Difficulty")){
                    ForEach(0 ..< difficultyOptions.count)
                    {
                        Text(self.difficultyOptions[$0])
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .scaledToFill()
                .scaleEffect(CGSize(width: 1.0, height: 1.34))
                .modifier(CustomFrame(height: 30,
                                      strokeColor: self.difficultyColor[difficultyIndex],
                                      background: self.difficultyColor[difficultyIndex],
                                      opacity: 0.9))
                .padding()
                
                TitleView()
                Spacer()
                
                TextField("Your name", text: $username)
                    .font(.title)
                    .modifier(CustomFrame(height: 30, strokeColor: .mint))
                    .multilineTextAlignment(TextAlignment.center)
                
                
                Picker(selection: $categoryIndex, label: Text("Category")) {
                    ForEach(0 ..< categoryOptions.count) {
                        Text(self.categoryOptions[$0])
                    }
                }
                .scaleEffect(CGSize(width: 1.4, height: 1.7))
                .modifier(CustomFrame(height: 30, strokeColor: .mint))
                
                
                Spacer()
                ReadyStartView(username: username,
                               difficulty: self.difficultyOptions[self.difficultyIndex],
                               category: self.categoryIndex)
            }
            .navigationBarHidden(true)
        }
        .environmentObject(game)
    }
}


struct TitleView: View {
    var body:some View {
        VStack {
            Text("?")
                .foregroundColor(.orange)
                .font(Font.custom("Montserrat-Bold", size: 180))
            Text("Tech Quiz")
                .foregroundColor(.orange)
                .font(Font.custom("Montserrat-Bold", size: 60))
                .bold()
        }
        .modifier(CustomFrame(height: 300, strokeColor: .mint))
    }
}


struct ReadyStartView: View {
    @EnvironmentObject var game: Game
    var username: String
    var difficulty: String
    var category: Int
    @State private var shouldTransit: Bool = false
    
    var body: some View {
        VStack {
            if username != "" {
                NavigationLink(destination: QuestionsView(),
                               isActive: $shouldTransit) {
                    Text("I'm ready")
                        .bold()
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .onTapGesture {
                            self.game.startGame(username: self.username,
                                                difficulty: self.difficulty,
                                                category: Int(self.category))
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                self.shouldTransit = true
                            }
                        }
                    
                }
                .modifier(CustomAnimation(height: 60, background: .green, strokeColor: .green))
            } else {
                Text("Loading...")
                    .font(.title)
                    .bold()
                    .foregroundColor(.gray)
                    .modifier(CustomFrame(height: 60, strokeColor: .yellow, background: .yellow))
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
