//
//  SeparatorView.swift
//  ToothpickLayout
//
//  Created by Andrey Vasilev on 26.11.2022.
//

import SwiftUI

struct SeparatorView: View {
    
    let lineWidth: Double
    let lineColor: Color
    let spacing: Double
    
    init(lineWidth: Double = 1, lineColor: Color = .black, spacing: Double = 2) {
        self.lineWidth = lineWidth
        self.lineColor = lineColor
        self.spacing = spacing
    }
    
    var body: some View {
        HStack(spacing: 0) {
            SeparatorLine(width: lineWidth, color: lineColor)
            Spacer(minLength: 0)
            SeparatorLine(width: lineWidth, color: lineColor)
        }
    }
}

struct SeparatorView_Previews: PreviewProvider {
    static var previews: some View {
        SeparatorView()
            .frame(width: 4)
            .background(Color.white)
    }
}
