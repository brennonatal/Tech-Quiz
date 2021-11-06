//
//  StartView.swift
//  Tech-Quiz
//
//  Created by Vitor Hugo Costa on 11/3/21.
//

import SwiftUI

struct StartView: View {
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
                .modifier(CustomFrame(height: 32, align: .center, strokeColor: self.difficultyColor[difficultyIndex], lineWidth: 3))
                .padding()
                
                TitleView()
                Spacer()
                
                TextField("Your name", text: $username)
                    .font(.title)
                    .modifier(CustomFrame(height: 30, align: .center, strokeColor: .mint, lineWidth: 3))
                    .multilineTextAlignment(TextAlignment.center)
                
                
                Picker(selection: $categoryIndex, label: Text("Category")) {
                    ForEach(0 ..< categoryOptions.count) {
                        Text(self.categoryOptions[$0])
                    }
                }
                .scaleEffect(CGSize(width: 1.4, height: 1.7))
                .modifier(CustomFrame(height: 30, align: .center, strokeColor: .mint, lineWidth: 3))
                
                
                Spacer()
                ReadyStartView(username: username)
            }
            .navigationBarHidden(true)
        }
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
        .modifier(CustomFrame(height: 300, align: .center, strokeColor: .mint, lineWidth: 3))
    }
}


struct ReadyStartView: View {
    var username: String
    var body: some View {
        VStack {
            if username != "" {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    NavigationLink(destination: QuestionsView()) {
                        Text("I'm ready")
                            .foregroundColor(.black)
                            .font(.largeTitle)
                    }
                }
                .modifier(CustomFrame(height: 60, align: .center, strokeColor: .green, lineWidth: 3, background: .green))
                
            } else {
                Text("Loading...")
                    .font(.title)
                    .bold()
                    .foregroundColor(.gray)
                    .modifier(CustomFrame(height: 60, align: .center, strokeColor: .yellow, lineWidth: 3, background: .yellow))
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
