//
//  SplashView.swift
//  Tech-Quiz
//
//  Created by Vitor Hugo Costa on 11/9/21.
//

import SwiftUI

struct SplashView : View{
    let universalSize = UIScreen.main.bounds
    @State var isAnimated = false
    
    var body: some View {
        
        ZStack {
            TitleView().body.frame(height: 555, alignment: .top)
            getSinWave(interval: universalSize.width, amplitude: 200, baseline: -50 + universalSize.height/2)
                .foregroundColor(Color.init(red: 1, green: 0.5, blue: 0.1).opacity(0.7))
                .offset(x: isAnimated ? -1*universalSize.width : 0)
                .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: isAnimated
            )
            getSinWave(interval: universalSize.width*1.2, amplitude: 100, baseline: 50 + universalSize.height/2)
                .foregroundColor(Color.init(red: 0.5, green: 1 , blue: 0.8).opacity(0.7))
                .offset(x: isAnimated ? -1*(universalSize.width*1.2) : 0)
                .animation(.linear(duration: 5).repeatForever(autoreverses: false), value: isAnimated
            )
        }.onAppear(){
            self.isAnimated = true
        }
            
    }
    func getSinWave(interval:CGFloat, amplitude: CGFloat = 100 ,baseline:CGFloat = UIScreen.main.bounds.height/2) -> Path {
        Path{path in
            path.move(to: CGPoint(x: 0, y: baseline
            ))
            path.addCurve(
                to: CGPoint(x: 1*interval,y: baseline),
                control1: CGPoint(x: interval * (0.35),y: amplitude + baseline),
                control2: CGPoint(x: interval * (0.65),y: -amplitude + baseline)
            )
            path.addCurve(
                to: CGPoint(x: 2*interval,y: baseline),
                control1: CGPoint(x: interval * (1.35),y: amplitude + baseline),
                control2: CGPoint(x: interval * (1.65),y: -amplitude + baseline)
            )
            path.addLine(to: CGPoint(x: 2*interval, y: universalSize.height))
            path.addLine(to: CGPoint(x: 0, y: universalSize.height))
            
            
        }
    
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
