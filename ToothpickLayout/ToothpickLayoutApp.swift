//
//  ToothpickLayoutApp.swift
//  ToothpickLayout
//
//  Created by Andrey Vasilev on 26.11.2022.
//

import SwiftUI

@main
struct ToothpickLayoutApp: App {
    
    let viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
        .commands {
              CommandMenu("Custom actions") {
                  Button("Reload") { viewModel.reload() }
                      .keyboardShortcut("R")
                  Button("Save layout") { viewModel.save() }
                      .keyboardShortcut("S")
              }
        }
    }
}
