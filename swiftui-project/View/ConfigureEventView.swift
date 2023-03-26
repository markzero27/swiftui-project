//
//  TaskItemListView.swift
//  swiftui-project
//
//  Created by Mark Daquis on 3/26/23.
//

import SwiftUI

struct ConfigureEventView: View {
    @Environment(\.dismiss) var dismiss
    @State var title: String = ""
    
    var body: some View {
        VStack {
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
            TextField("Title", text: $title)
                .padding(10)
                .border(.black, width: 2)
            HStack(spacing: 5) {
                Image(systemName: "clock")
                Text("Length")
                Spacer()
            }
            .padding(10)
            .border(.black, width: 2)
            HStack(spacing: 5) {
                Image(systemName: "square.grid.2x2")
                Text("Theme")
                Spacer()
            }
            .padding(10)
            .border(.black, width: 2)
            
            Spacer()
            HStack {
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Spacer()
                        Text("Cancel")
                        Spacer()
                    }
                }
                Button {
                    
                } label: {
                    HStack {
                        Spacer()
                        Text("Save")
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(10)
                    .background(Color.blue)
                    .border(.black, width: 2)
                }
                

            }
        }
        .padding()
    }
}

struct ConfigureEventView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigureEventView()
    }
}
