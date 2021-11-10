//
//  QuestionsView.swift
//  Tech-Quiz
//
//  Created by Brenno Natal on 30/10/21.
//

import SwiftUI


struct LevelView: View {
    var title: String
    
    var body: some View {
            Text(self.title)
            .font(Font.custom("Orbitron", size: 20))
                .modifier(CustomFrame(height: 180, strokeColor: .mint))
                .foregroundColor(.orange)

    }
}


struct QuestionsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var game: Game
    
    @State var question: Question = Question()
    @State var answers: [Answer] = []
    
    @State var shouldTransit: Bool = false
    @State var isGameOver: Bool = false
    @State var answerColor: Color = .orange
    
    var body: some View {
            VStack {
                Spacer()
                LevelView(title: question.question.base64Decoded()!)
                Spacer()
                
                ForEach(self.answers) { answer in
                    NavigationLink(destination: getNextView(endView: self.isGameOver),
                                   isActive: $shouldTransit) {
                        Text(answer.title.base64Decoded()!)
                            .font(Font.custom("Orbitron", size: 20))
                            .foregroundColor(.black)
                            .modifier(CustomFrame(height: 50, strokeColor: self.answerColor))
                            .onTapGesture {
                                // checking answer
                                if answer.isCorrect {
                                    self.answerColor = .green
                                    self.game.score += 1
                                    // make api call to register point
                                    markPoint(user: self.game.username)
                                } else {
                                    self.answerColor = .red
                                }
                                if self.game.isOver() {
                                    self.isGameOver = true
                                }
                                // procede to next question
                                self.game.questionIndex += 1
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    self.shouldTransit = true
                                }
                            }
                    }
                }
                Spacer()
            }
            .padding()
            .onAppear {
                self.question = loadQuestion(questions: self.game.questions,
                                             questionIndex: self.game.questionIndex)
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
                        .modifier(CustomFrame(height: 50, strokeColor: .green, background: .green))
                    
                } else {
                    Text("Bad Answer!!")
                        .modifier(CustomFrame(height: 50, strokeColor: .red, background: .red))
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
    }
    
}


