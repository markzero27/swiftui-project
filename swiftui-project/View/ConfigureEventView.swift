//
//  TaskItemListView.swift
//  swiftui-project
//
//  Created by Mark Daquis on 3/26/23.
//

import SwiftUI

struct ConfigureEventView: View {
    
    // MARK: - Properties
    
    @Environment(\.dismiss) var dismiss
    @State var title: String = ""
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            deleteButtonView
            titleView
            timePickerView
            themePickerView
            Spacer()
            actionButtonsView
        }
        .padding()
    }
}

// MARK: - Components

private extension ConfigureEventView {
    var titleView: some View {
        TextField("Title", text: $title)
            .borderBoxStyle()
    }
    
    var timePickerView: some View {
        HStack(spacing: 5) {
            Image(systemName: "clock")
            Text("Length")
            Spacer()
        }
        .borderBoxStyle()
    }
    
    var themePickerView: some View {
        HStack(spacing: 5) {
            Image(systemName: "square.grid.2x2")
            Text("Theme")
            Spacer()
        }
        .borderBoxStyle()
    }
    
    var actionButtonsView: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Text("Cancel")
            }
            .frame(width: 125)
            Button {
                // save task
            } label: {
                Text("Save")
                    .fullWidth()
                    .borderBoxStyle()
                    .background(Color.blue)
                    .foregroundColor(.white)
               
                
            }
        }
    }
    
    var deleteButtonView: some View {
        HStack {
            Spacer()
            Button {
                dismiss()
            } label: {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
            .padding()
        }
    }
}

// MARK: - Preview

struct ConfigureEventView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigureEventView()
    }
}
