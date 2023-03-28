//
//  TaskItemView.swift
//  swiftui-project
//
//  Created by Mark Daquis on 3/26/23.
//

import SwiftUI

struct TaskItemView: View {
    
    // MARK: - Properties
    
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var taskItem: Item
    
    // MARK: - Body
    
    var body: some View {
        HStack (alignment: .center, spacing: 5) {
            Text(taskItem.text ?? "")
                .font(.headline)
                .foregroundColor(.black)
            Spacer()
            HStack {
                Text("\(taskItem.length)")
                    .font(Font.system(size: 12, weight: .bold))
                Image(systemName: "clock")
                    .font(Font.system(size: 20, weight: .bold))
                Image(systemName: "chevron.right")
                    .font(Font.system(size: 16, weight: .regular))
            }
            .foregroundColor(.gray)
    
        }
        .padding(.vertical, 24)
        .padding(.horizontal, 16)
        .background(taskItem.theme.color)
    }
}
