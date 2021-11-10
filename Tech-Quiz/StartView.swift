//
//  StartView.swift
//  Tech-Quiz
//
//  Created by Vitor Hugo Costa on 11/3/21.
//

import SwiftUI

struct StartView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
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
                .accentColor(.blue)
                .scaleEffect(CGSize(width: 1.4, height: 1.7))
                .modifier(CustomFrame(height: 30, strokeColor: .mint))
                
                
                Spacer()
                ReadyStartView(username: username,
                               difficulty: self.difficultyOptions[self.difficultyIndex],
                               category: self.categoryIndex)
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        .environmentObject(game)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)

    }
}


struct TitleView: View {
    var body:some View {
        VStack {
            Text("?")
                .foregroundColor(.orange)
                .font(Font.custom("Orbitron", size: 170))
            Text("Tech Quiz")
                .font(Font.custom("Orbitron", size: 50))
                .bold()
                .foregroundColor(Color.init(red: 0.1, green: 0.9 , blue: 0.6))

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
    @State private var loading: Bool = false
    
    @State private var loadAmount = 0.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            if username != "" {
                NavigationLink(destination: QuestionsView(),
                               isActive: $shouldTransit) {
                    if !loading {
                        Text("I'm ready")
                            .bold()
                            .foregroundColor(.black)
                            .font(.largeTitle)
                            .modifier(CustomAnimation(height: 60, background: .green, strokeColor: .green))
                            .onTapGesture {
                                self.game.startGame(username: self.username,
                                                    difficulty: self.difficulty,
                                                    category: Int(self.category))
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    self.shouldTransit = true
                                }
                                self.loading = true
                            }
                    } else {
                        ProgressView(value: loadAmount, total: 10)
                            .progressViewStyle(.linear)
                            .accentColor(Color.secondary)
                            .scaleEffect(x: 1, y: 4, anchor: .center)
                            .modifier(CustomAnimation(height: 60, background: .green, strokeColor: .green))
                            .onReceive(timer) { _ in
                                            if loadAmount < 10 {
                                                loadAmount += 1
                                            }
                                        }
                    }
                }

            } else {
                Text("What's your name?")
                    .font(Font.custom("Orbitron", size: 25))
                    .bold()
                    .foregroundColor(Color.init(red: 1, green: 0.3, blue: 0.1).opacity(0.7))
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
