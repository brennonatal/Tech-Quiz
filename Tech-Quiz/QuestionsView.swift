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
            ZStack{
                
                shape
                Text("Level")
                    .font(.largeTitle)
                    .foregroundColor(.mint)
            }
            
        }
        
    }
    
}

struct QuestionsView: View {
    @State var isBool = true
    var body: some View {
        
        VStack{
            
            LevelView()
                .padding(30)
            Spacer()
            if isBool{
                QuestionCardView(choice: "True", rightAns:true)
                QuestionCardView(choice: "False", rightAns:false)
            } else{
            QuestionCardView(choice: "A", rightAns:true)
            QuestionCardView(choice: "B", rightAns:false)
            QuestionCardView(choice: "C", rightAns:false)
            QuestionCardView(choice: "D", rightAns:false)
            }
            
            Spacer()
            
        }.padding()
        
        
        
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
                .frame(width: 320, height: 90, alignment: .top)
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
    
    struct QuestionsView_Previews: PreviewProvider {
        static var previews: some View {
           
            QuestionsView()
                .preferredColorScheme(.dark)
            
            QuestionsView()
                .preferredColorScheme(.light)
        }
        
    }
    
}
