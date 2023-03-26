//
//  View+Extensions.swift
//  swiftui-project
//
//  Created by Mark Daquis on 3/26/23.
//

import Foundation
import SwiftUI

extension View {
    
    func embedNAvigationView() -> some View {
        return NavigationView { self }
    }
    
    func fullWidth() -> some View {
        return HStack {
            Spacer()
            self
            Spacer()
        }
    }
    
    func fullHeight() -> some View {
        return VStack {
            Spacer()
            self
            Spacer()
        }
    }
    
    func borderBoxStyle() -> some View {
        modifier(BorderBoxStyle())
    }
}
