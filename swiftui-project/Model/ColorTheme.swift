//
//  TaskItem.swift
//  swiftui-project
//
//  Created by Mark Daquis on 3/26/23.
//

import Foundation
import SwiftUI

enum ColorTheme: Int, CaseIterable {
    case yellow = 0
    case darkgreen = 1
    case red = 2
    
    var color: Color {
        switch self {
        case .yellow:
            return .ui.yellow
        case .darkgreen:
            return .ui.darkGreen
        case .red:
            return .ui.red
        }
    }
}
