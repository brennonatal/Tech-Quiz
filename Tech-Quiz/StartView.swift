//
//  StartView.swift
//  Tech-Quiz
//
//  Created by Vitor Hugo Costa on 11/3/21.
//

import SwiftUI

struct StartView: View {
    @State var username: String = ""
    @State var tapped: Bool = false
    @State var difficultyIndex = 0
    var difficultyOptions = ["Easy", "Medium",  "Hard"]
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
                ZStack {
                    // make this shape global?
                    let shape  = RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 3)
                        .frame(width: 360, height: 75, alignment: .top)
                    if difficultyIndex == 0{
                        shape.foregroundColor(.green)
                        
                    } else if difficultyIndex == 1 {
                        shape.foregroundColor(.orange)
                    } else {
                        shape.foregroundColor(.red)
                    }
                    
                    Picker(selection: $difficultyIndex, label: Text("Difficulty")){
                        ForEach(0 ..< difficultyOptions.count)
                        {
                            Text(self.difficultyOptions[$0])
                        }
                    }
                    .frame(width: 340, height: 100, alignment: .center)
                    .pickerStyle(SegmentedPickerStyle())
                    .scaledToFit()
                    .scaleEffect(CGSize(width: 1.0, height: 1.34))
                }
                
                TitleView()
                Spacer()
                ZStack {
                    let shape  = RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 3)
                        .frame(width: 360, height: 50, alignment: .center)
                        .foregroundColor(.mint)
                    shape
                    
                    TextField("Your name", text: $username)
                        .frame(width: 240, height: 30, alignment: .center)
                        .scaledToFit()
                        .scaleEffect(CGSize(width: 1.4, height: 1.5))
                        .multilineTextAlignment(TextAlignment.center)
                }
                .padding()
                
                ZStack{
                    let shape  = RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 3)
                        .frame(width: 360, height: 50, alignment: .center)
                        .foregroundColor(.mint)
                    shape
                    
                    Picker(selection: $categoryIndex, label: Text("Category")) {
                        ForEach(0 ..< categoryOptions.count) {
                            Text(self.categoryOptions[$0])
                        }
                    }.frame(width: 240, height: 30, alignment: .center)
                        .scaledToFit()
                        .scaleEffect(CGSize(width: 1.4, height: 1.5))
                }
                .padding()
                
                Spacer()
                ReadyStartView(username: username)
            }
            .navigationBarHidden(true)
        }
    }
}


struct TitleView: View{
    var body:some View{
        VStack{
            let shape  = RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 3)
                .frame(width: 360, height: 360, alignment: .top)
                .foregroundColor(.mint)
            ZStack{
                shape
                VStack() {
                    Text("?")
                        .foregroundColor(.orange)
                        .padding()
                        .font(Font.custom("Montserrat-Bold", size: 180))
                    Text("Tech Quiz")
                        .foregroundColor(.orange)
                        .padding()
                        .font(.largeTitle)
                }
            }
        }
    }
}


struct ReadyStartView: View {
    var username: String
    var body: some View {
        ZStack {
            let shape  = RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 5)
                .frame(width: 360, height: 90, alignment: .top)
            if username != "" {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    NavigationLink(destination: QuestionsView()) {
                        Text("I'm ready")
                            .foregroundColor(.green)
                            .font(.largeTitle)
                            .bold()
                    }
                }
                shape.foregroundColor(.green)
                
            } else {
                shape
                    .foregroundColor(.yellow)
                Text("Loading...")
                    .font(.title)
                    .bold()
                    .foregroundColor(.gray)
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
