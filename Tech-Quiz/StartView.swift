//
//  StartView.swift
//  Tech-Quiz
//
//  Created by Vitor Hugo Costa on 11/3/21.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        VStack{

            LevelOptionView()
            TitleView()
                
            CategoryOptionView().padding()
            Spacer()
            ReadyStartView()
            
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
                Text("Tech Quiz").foregroundColor(.orange).padding().font(.largeTitle)
            }
            
        }
    }
}



struct LevelOptionView: View{
    @State var tapped: Bool = false
    @State private var difficultyIndex = 0
    var difficultyOptions = ["Easy", "Medium",  "Hard"]
    @State var colors: Color = .mint
    
    
    
    var body: some View{
        HStack{
            ZStack{
                let shape  = RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 3)
                    .frame(width: 360, height: 75, alignment: .top)
                if difficultyIndex == 0{
                    shape.foregroundColor(.green)
                    
                }else if difficultyIndex == 1 {
                    shape.foregroundColor(.orange)
                }else{
                    shape.foregroundColor(.red)
                }
                
        
                Picker(selection: $difficultyIndex, label: Text("Difficulty")){
                    ForEach(0 ..< difficultyOptions.count)
{
                        Text(self.difficultyOptions[$0])
                    }
                    

                    
                }.frame(width: 340, height: 100, alignment: .center)
                    .pickerStyle(SegmentedPickerStyle())
                    .scaledToFit()
                    .scaleEffect(CGSize(width: 1.0, height: 1.34))
                
                
            }
        }.onTapGesture {
            tapped = !tapped
            
        }
    }
    
}


struct CategoryOptionView: View{
    @State var categoryIndex = 0
    var categoryOptions = ["Any Category",
                           "General Knowledge",
                           "Entertainment: Books",
                           "Entertainment: Film",
                           "Entertainment: Music",
                           "Entertainment: Musicals & Theatres",
                           "Entertainment: Television",
                           "Entertainment: Video Games",
                           "Entertainment: Board Games",
                           "Science & Nature",
                           "Science: Computers",
                           "Science: Mathematics",
                           "Mythology",
                           "Sports",
                           "Geography",
                           "History",
                           "Politics",
                           "Art",
                           "Celebrities",
                           "Animals",
                           "Vehicles",
                           "Entertainment: Comics",
                           "Science: Gadgets",
                           "Entertainment: Japanese Anime & Manga",
                           "Entertainment: Cartoon & Animations"]
    
    var body: some View{
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
}
    
    
}
    


struct ReadyStartView: View{
    @State var ready: Bool = false
    var body: some View {
        ZStack {
            let shape  = RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 3)
                .frame(width: 360, height: 90, alignment: .top)
            if ready{
                Text("Start")
                shape.foregroundColor(.green)
                
            }else{
                shape.foregroundColor(.yellow)
                Text("Loading...")
                
                
            }
            
        }.onTapGesture {
            ready = !ready
        }
        
    }
    
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
