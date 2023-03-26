//
//  TaskItem.swift
//  swiftui-project
//
//  Created by Mark Daquis on 3/26/23.
//

import Foundation
import SwiftUI


enum ColorTheme {
    case yellow, darkgreen, red
    
    var theme: Color {
        switch self {
        case .yellow:
            return Color("yellow")
        case .darkgreen:
            return Color("darkGreen")
        case .red:
            return Color("red")
        }
    }
}
struct TaskItem {
    let title: String
    let length: Int
    let color: ColorTheme
}
