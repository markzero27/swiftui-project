//
//  TaskItemDetailsView.swift
//  swiftui-project
//
//  Created by Mark Daquis on 3/26/23.
//

import SwiftUI

struct TaskItemDetailsView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Minutes Elapse")
                    HStack {
                        Image(systemName: "hourglass.bottomhalf.filled")
                        Text("19")
                    }
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Minutes Remaining")
                    HStack {
                        Text("19")
                        Image(systemName: "hourglass.tophalf.filled")
                    }
                }
            }
            .padding()
            Spacer()
            VStack {
                Text("Design The App")
                    .padding(.bottom)
                HStack(alignment: .top) {
                    VStack {
                        Text("101")
                        Text("minutes")
                    }
                    Text(":")
                    VStack {
                        Text("101")
                        Text("minutes")
                    }
                }
            }
            Spacer()
            HStack {
                Image(systemName: "stop.circle")
                    .foregroundColor(.red)
                Image(systemName: "play.circle")
                    .foregroundColor(.blue)
                Image(systemName: "pause.circle")
                    .foregroundColor(.gray)
            }
            .padding()
        }
        .toolbar {
            ToolbarItem {
                Button(action: {}) {
                    Text("Edit")
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.ui.yellow)
        .cornerRadius(10)
        .padding()
        
    }
}

struct TaskItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TaskItemDetailsView()
    }
}
