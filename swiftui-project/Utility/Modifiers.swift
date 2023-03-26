//
//  Modifiers.swift
//  swiftui-project
//
//  Created by Mark Daquis on 3/26/23.
//

import SwiftUI

struct BorderBoxStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .border(.black, width: 2)
    }
}
