//
//  ViewModel.swift
//  ToothpickLayout
//
//  Created by Andrey Vasilev on 26.11.2022.
//

import AppKit

final class ViewModel: ObservableObject {    
    
    @Published var urls: [[URL]] = []

    private var index: Int = 0
    private var files: [URL]?
    private let pageCount = 30
    private let rowCount = 3

    init(urls: [[URL]] = []) {
        self.urls = urls
    }
}

extension ViewModel {
    
    func reload() {
        if files == nil {
            files = showOpenPanel()
        }
        guard let files else { return }
        reloadLayout(files: files)
    }
    
    func save() {
        guard let data = snapshot(),
              let url = showSavePanel()
        else { return }
                
        do {
            try data.write(to: url, options: .atomicWrite)
        } catch {
            print(error.localizedDescription)
        }
    }
}

private extension ViewModel {
    
    func reloadLayout(files: [URL]) {
        guard index < files.count else {
            print("Index \(index) is out of files size of \(files.count)")
            return
        }
        let start = index
        let end = min(index + pageCount, files.count)
        var urls = [[URL]]()
        var row = [URL]()
        for i in start ..< end {
            let index = min(i, files.count - 1)
            let item = files[index]
            row.append(item)
            if row.count == rowCount {
                urls.append(row)
                row.removeAll()
            }
        }
        self.urls = urls
        self.index += pageCount
    }
    
    func snapshot() -> Data? {

        guard let window = NSApp.mainWindow,
              let view = window.contentView
        else { return nil }
        let contentRect = NSRect(origin: .zero, size: view.intrinsicContentSize)
        
        guard let bitmapRep = view.bitmapImageRepForCachingDisplay(in: contentRect) else { return nil }
        
        view.cacheDisplay(in: contentRect, to: bitmapRep)
//        let image = NSImage(size: bitmapRep.size)
//        image.addRepresentation(bitmapRep)
        
        let data = bitmapRep.representation(using: .png, properties: [:])

        return data
    }
    
    func showSavePanel() -> URL? {
        let savePanel = NSSavePanel()
        savePanel.allowedContentTypes = [.jpeg]
        savePanel.canCreateDirectories = true
        savePanel.isExtensionHidden = false
        savePanel.title = "Save your image"
        savePanel.message = "Choose a folder and a name to store the image."
        savePanel.nameFieldLabel = "Image file name:"
        
        let response = savePanel.runModal()
        return response == .OK ? savePanel.url : nil
    }
    
    func showOpenPanel() -> [URL]? {
        let openPanel = NSOpenPanel()
        openPanel.allowedContentTypes = [.svg]
        openPanel.allowsMultipleSelection = true
        openPanel.title = "Choose .svg files"
        
        let response = openPanel.runModal()
        return response == .OK ? openPanel.urls : nil
    }
}
