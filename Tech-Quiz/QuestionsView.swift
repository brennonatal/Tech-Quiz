//
//  QuestionsView.swift
//  Tech-Quiz
//
//  Created by Brenno Natal on 30/10/21.
//

import SwiftUI


struct LevelView: View {
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
                    
                        Text("Question")
                            .font(.largeTitle)
                            .foregroundColor(.mint)
                        
                        
                    }
                }
                
                
            }
            
        }
    }
    
}


struct QuestionsView: View {
    @State var isBool = false
    @State var choices = ["A","B","C","D"]
    @State var questions : [Question] = []
    @State var answers : [Answer] = []
    @State var boolChoices = ["True","False"]
    var body: some View {
        
        VStack{
            LevelView()
                .padding(30)
            Spacer()
            if isBool{
                QuestionCardView(choice: "True", rightAns:true)
                QuestionCardView(choice: "False", rightAns:false)
                
            } else{
//                UNDER DEVELOPMENT
//                List(answers) { answer in
//                    QuestionCardView(choice: answer.title, rightAns: answer.isCorrect)
//                }
                QuestionCardView(choice: "A", rightAns:true)
                QuestionCardView(choice: "B", rightAns:false)
                QuestionCardView(choice: "C", rightAns:false)
                QuestionCardView(choice: "D", rightAns:false)
            }
            
            Spacer()
            
        }
        .padding()
        .onAppear {
            Game(difficulty: "easy", category: 1).loadQuestions { (question) in
                self.questions = questions
                
            }
//            UNDER DEVELOPMENT
//            getAnswers(question: self.questions[0]) { answers in
//                self.answers = answers
//            }
            
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
