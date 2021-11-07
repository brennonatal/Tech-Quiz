//
//  QuestionsView.swift
//  Tech-Quiz
//
//  Created by Brenno Natal on 30/10/21.
//

import SwiftUI


struct LevelView: View {
    var title : String
    
    var body: some View {
        VStack{
            Text(self.title)
                .font(.title2)
                .modifier(CustomFrame(height: 180, strokeColor: .mint))
                .foregroundColor(.orange)
        }
    }
}


struct QuestionsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var game: Game
    
    @State var question : Question = Question()
    @State var questionIndex: Int
    @State var answers : [Answer] = []
    
    @State var tappedAnswer: Bool = false
    
    var body: some View {
            VStack {
                LevelView(title: question.question.base64Decoded()!)
                Spacer()
                
                ForEach(self.answers) { answer in
                    Button(action: {
//                        checkAnswer(answer)
//                        DispatchQueue.main.asyncAfter(deadline: .now()+2) {}
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        NavigationLink(destination: QuestionsView(questionIndex: self.questionIndex + 1)) {
                            Text(answer.title.base64Decoded()!)
                                .foregroundColor(.black)
                                .modifier(CustomFrame(height: 50, strokeColor: .orange))
                        }
                    }
                }
                Spacer()
            }
            .padding()
            .onAppear {
                self.question = loadQuestion(questions: self.game.questions,
                                             questionIndex: self.questionIndex)
                self.answers = getAnswers(question: self.question)
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
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
        QuestionsView(questionIndex: 0)
    }
    
}


