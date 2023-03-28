//
//  ConfigureEventViewModel.swift
//  swiftui-project
//
//  Created by Mark Daquis on 3/28/23.
//

import Foundation
import SwiftUI

class ConfigureEventViewModel: ObservableObject {
    
    // MARK: - Publishers
    
    @Published var title: String = ""
    @Published var length: Int = 30
    @Published var colorTheme: ColorTheme = .yellow
    
    // MARK: - Properties
    
    var id: UUID?
    var isNew: Bool { id == nil } 
   
    // MARK: - Initialization
    
    init(task: Item?) {
        guard let item = task else { return }
        self.id = item.id
        self.title = item.text ?? ""
        self.length = Int(item.length)
        self.colorTheme = ColorTheme(rawValue: Int(item.colorTheme)) ?? .yellow
    }
}
