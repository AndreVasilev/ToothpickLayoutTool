//
//  ToothpickView.swift
//  ToothpickLayout
//
//  Created by Andrey Vasilev on 26.11.2022.
//

import SwiftUI
import SVGView

struct ToothpickView: View {
    
    static let imageSize = CGSize(width: 667, height: 500)

    let url: URL
    
    private let spacing = 6.0
    private let space = 28.0

    var body: some View {
        HStack(spacing: spacing) {
            SVGView(contentsOf: url)
            SeparatorView(lineWidth: 4)
                .frame(width: space - 2 * spacing)
            SVGView(contentsOf: url)
        }
        .background(Color.white)
        .frame(width: Self.imageSize.width * 2 + space,
               height: Self.imageSize.height)
        .fixedSize()
    }
}

struct ToothpickView_Previews: PreviewProvider {
    
    static var previews: some View {
        ToothpickView(url: Bundle.main.url(forResource: "ad", withExtension: ".svg")!)
    }
}
