//
//  SeparatorLine.swift
//  ToothpickLayout
//
//  Created by Andrey Vasilev on 26.11.2022.
//

import SwiftUI

struct SeparatorLine: View {
    
    let width: Double
    let color: Color

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                path.move(to: CGPoint(x: width / 2, y: 0))
                path.addLine(to: CGPoint(x: width / 2, y: geometry.size.height))
                path.closeSubpath()
            }
            .stroke(style: StrokeStyle(lineWidth: width,
                                       dash: [12]))
            .foregroundColor(color)
        }
        .frame(width: width)
    }
}

struct SeparatorLine_Previews: PreviewProvider {
    
    static var previews: some View {
        SeparatorLine(width: 1, color: .black)
            .background(Color.white)
    }
}
