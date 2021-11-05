//
//  QuestionsView.swift
//  Tech-Quiz
//
//  Created by Brenno Natal on 30/10/21.
//

import SwiftUI


struct LevelView: View {
    var title : String
    var index = LevelOptionView().difficultyIndex
    var options = LevelOptionView().difficultyOptions
    
    var body: some View {
        HStack{
            let shape = RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 3)
                .frame(width: 120, height: 80, alignment: .center)
        
            
            VStack{
                
                ZStack{
                    shape
                    Text(options[index])
                  
                        .foregroundColor(.mint)
                }.padding()
                VStack{
                    Text(self.title)
                        .font(.title2)
                        .frame(width: 340, height: 180)
                        .foregroundColor(.orange)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.mint, lineWidth: 5)
                        )
                }
            }
            
            
        }
    }
}



struct QuestionsView: View {
    @State var question : Question = Question()
    @State var answers : [Answer] = []
    @State var index = LevelOptionView().difficultyIndex
    @State var options = LevelOptionView().difficultyOptions
    
    var body: some View {
        
        VStack{
            
            
            LevelView(title: self.question.question.base64Decoded()!)
            List(self.answers) { answer in
                QuestionCardView(choice: answer.title.base64Decoded()!, rightAns: answer.isCorrect).scaledToFill()
            }.scaledToFill()
                

            
            Spacer()
            
        }

        .padding()
        .onAppear {
            Game(difficulty: options[index], category: 1).loadQuestion { (question) in
                self.question = question
                getAnswers(question: question) { answers in
                    self.answers = answers
                }
            }
            
        }
        
    }
    
    
    struct QuestionCardView: View {
        var choice: String
        @State var rightAns: Bool
        @State var cardUp: Bool = false
        var body: some View {
            ZStack{
                let shape  = RoundedRectangle(cornerRadius: 20)
                    .font(.title2)
                    .frame(width: 265, height: 40)
                    .scaleEffect(CGSize(width: 1.05, height: 1.1))
//                    .foregroundColor(.orange)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.mint, lineWidth: 5)
                    )
                
                if cardUp {
                    
                    
                    if rightAns{
                        shape.foregroundColor(.green)
                        Text("Right Answer!!")
                        

                            
                        
                    }else{
                        shape.foregroundColor(.red)
                        Text("Bad Answer!!")
                        
                    }
                    
                }else{
                    
                    
                    
                    Text(choice)
                        .font(.title2)
                        .frame(width: 265, height: 40, alignment: .center)
                        .foregroundColor(.orange)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.mint, lineWidth: 5)
                        )
                }
            }.scaleEffect(CGSize(width: 1.12, height: 1.05))
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
    
}
