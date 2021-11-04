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
        HStack{
            let shape = RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 3)
                .frame(width: 800, height: 80, alignment: .top)
            VStack{
                
                ZStack{
                    shape
                    Text("Difficulty")
                        .font(.largeTitle)
                        .foregroundColor(.mint)
                }.padding()
                VStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(.mint)
                            .frame(width: 380, height: 190, alignment: .top)
                        
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.gray)
                            .frame(width: 370, height: 180, alignment: .top)
                        
                        Text(self.title)
                            .font(.largeTitle)
                            .foregroundColor(.mint)
                    }
                }
            }
        }
    }
}


struct QuestionsView: View {
    @State var question : Question = Question()
    @State var answers : [Answer] = []
    
    var body: some View {
        
        VStack{
            LevelView(title: self.question.question)
                .padding(30)
            Spacer()
            
            List(self.answers) { answer in
                QuestionCardView(choice: answer.title, rightAns: answer.isCorrect)
            }
            
            Spacer()
            
        }
        .padding()
        .onAppear {
            Game(difficulty: "easy", category: 1).loadQuestion { (question) in
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
                    .stroke(lineWidth: 3)
                    .frame(width: 360, height: 90, alignment: .top)
                if cardUp {
                    
                    
                    if rightAns{
                        Text("Right Answer!!")
                        shape.foregroundColor(.green)
                        
                    }else{
                        shape.foregroundColor(.red)
                        Text("Bad Answer!!")
                        
                    }
                    
                }else{
                    
                    shape.foregroundColor(.orange)
                    Text(choice)
                }
            }.onTapGesture {
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
