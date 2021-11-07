//
//  Utils.swift
//  Tech-Quiz
//
//  Created by Brenno Natal on 05/11/21.
//

import Foundation
import SwiftUI


extension String {
    func base64Decoded() -> String? {
        guard let data = Data(base64Encoded: self) else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.size.width * 0.85
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}


struct CustomFrame: ViewModifier {
    var width: CGFloat = UIScreen.screenWidth
    var height: CGFloat?
    var align: Alignment = .center
    var strokeColor: Color
    var lineWidth: CGFloat = 3
    var background: Color = .clear
    var opacity: CGFloat?
    
    func body(content: Content) -> some View {
        content
            .frame(width: self.width, height: self.height, alignment: self.align)
            .padding()
            .opacity(self.opacity ?? 1)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(self.strokeColor, lineWidth: self.lineWidth)
            ).background(RoundedRectangle(cornerRadius: 20).fill(self.background))
    }
}

struct CustomAnimation: ViewModifier {
    @State private var animationAmount = 1.0
    var height: CGFloat?
    var background: Color = .clear
    var strokeColor: Color
    
    func body(content: Content) -> some View {
        content
            .frame(width: UIScreen.screenWidth, height: self.height, alignment: .center)
            .padding()
            .background(self.background)
            .opacity(0.9)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(self.strokeColor)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(
                        .easeInOut(duration: 1)
                            .repeatForever(autoreverses: false),
                        value: animationAmount
                    )
            )
            .onAppear {
                animationAmount = 2
            }
        
    }
}


