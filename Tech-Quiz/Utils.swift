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
    var width: CGFloat?
    var height: CGFloat?
    var align: Alignment
    var strokeColor: Color
    var lineWidth: CGFloat
    var background: Color?
    
    func body(content: Content) -> some View {
        content
            .frame(width: self.width ?? UIScreen.screenWidth, height: self.height, alignment: self.align)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(self.strokeColor, lineWidth: self.lineWidth)
            ).background(RoundedRectangle(cornerRadius: 20).fill(self.background ?? Color.clear))
    }
}