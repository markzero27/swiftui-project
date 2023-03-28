//
//  Keyboard+Extensions.swift
//  swiftui-project
//
//  Created by Mark Daquis on 3/28/23.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
