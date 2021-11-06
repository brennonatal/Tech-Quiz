//
//  QuestionsView.swift
//  Tech-Quiz
//
//  Created by Brenno Natal on 30/10/21.
//

import SwiftUI


struct LevelView: View {
    var title : String
    var index = StartView().difficultyIndex
    var options = StartView().difficultyOptions
    
    var body: some View {
        VStack{
            Text(options[index])
                .foregroundColor(.mint)
                .modifier(CustomFrame(width: 80, height: 50, align: .center, strokeColor: .white))
            
            Text(self.title)
                .font(.title2)
                .modifier(CustomFrame(height: 180, strokeColor: .mint))
                .foregroundColor(.orange)
        }
    }
}


struct QuestionsView: View {
    @EnvironmentObject var game: Game
    
    @State var question : Question = Question()
    @State var answers : [Answer] = []
    @State var index = StartView().difficultyIndex
    @State var options = StartView().difficultyOptions
    
    var body: some View {
        NavigationView {
            VStack {
                LevelView(title: self.question.question.base64Decoded()!)
//                List(self.answers) { answer in
//                    QuestionCardView(choice: answer.title.base64Decoded()!, rightAns: answer.isCorrect).scaledToFill()
//                }.scaledToFill()
                QuestionCardView(choice: "1", rightAns: true)
                QuestionCardView(choice: "1", rightAns: false)
                QuestionCardView(choice: "1", rightAns: false)
                QuestionCardView(choice: "1", rightAns: false)
                
                
                Spacer()
                
            }
            .padding()
//            .onAppear {
//                Game(difficulty: options[index], category: 1).loadQuestion { (question) in
//                    self.question = question
//                    getAnswers(question: question) { answers in
//                        self.answers = answers
//                    }
//                }
//            }
            .navigationBarHidden(true)
        }
    }
}


struct QuestionCardView: View {
    var choice: String
    @State var rightAns: Bool
    @State var cardUp: Bool = false
    var body: some View {
        VStack{
            if cardUp {
                if rightAns{
                    Text("Right Answer!!")
                        .modifier(CustomFrame(height: 50, strokeColor: .green))
                } else {
                    Text("Bad Answer!!")
                        .modifier(CustomFrame(height: 50, strokeColor: .red))
                }
                
            } else {
                Text(choice)
                    .font(.title2)
                    .foregroundColor(.orange)
                    .modifier(CustomFrame(height: 50, strokeColor: .orange))
            }
        }
        .onTapGesture {
            cardUp = !cardUp
            
        }
    }
    
}


struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        
        QuestionsView()
            .preferredColorScheme(.dark)
        
    }
    
}


