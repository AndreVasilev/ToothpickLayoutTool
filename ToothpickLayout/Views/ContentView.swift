//
//  ContentView.swift
//  ToothpickLayout
//
//  Created by Andrey Vasilev on 26.11.2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    private let spacing = 6.0
    private let line = 3.0

    var body: some View {
        VStack(spacing: spacing) {
            ForEach(viewModel.urls, id: \.self) { row in
                VStack(spacing: spacing) {
                    HStack(spacing: spacing) {
                        ForEach(row, id: \.self) { url in
                            HStack(spacing: spacing) {
                                ToothpickView(url: url)
                                Color.black
                                    .frame(width: line,
                                           height: ToothpickView.imageSize.height)
                            }
                        }
                    }
                    Color.black
                        .frame(width: ToothpickView.imageSize.width * 6,
                               height: line)
                }
            }
        }
        .padding()
        .background(Color.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let url = Bundle.main.url(forResource: "ad", withExtension: ".svg")!
        let viewModel = ViewModel(urls: [[url, url, url],
                                         [url, url, url],
                                         [url, url, url],
                                         [url, url, url]])
        ContentView(viewModel: viewModel)
    }
}
