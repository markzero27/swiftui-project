//
//  TaskItemDetailsView.swift
//  swiftui-project
//
//  Created by Mark Daquis on 3/26/23.
//

import SwiftUI

struct TaskDetailsView: View {
    // MARK: - Properties
    
    @State private var isPresented: Bool = false
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            minutesElapsedView
            Spacer()
            activeTimerView
            Spacer()
            actionbuttonsView
        }
        .toolbar {
            ToolbarItem {
                Button(action: { isPresented.toggle() }) {
                    Text("Edit")
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.ui.yellow)
        .cornerRadius(10)
        .padding()
        .fullScreenCover(isPresented: $isPresented) {
            ConfigureEventView()
        }
        
    }
}

// MARK: - Components

private extension TaskDetailsView {
    
    var minutesElapsedView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Minutes Elapse")
                    .font(.caption)
                HStack {
                    Image(systemName: "hourglass.bottomhalf.filled")
                        .font(.title)
                    Text("19")
                        .font(.caption)
                }
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text("Minutes Remaining")
                    .font(.caption)
                HStack {
                    Text("101")
                        .font(.caption)
                    Image(systemName: "hourglass.tophalf.filled")
                        .font(.title)
                }
            }
        }
        .padding(20)
    }
    
    var activeTimerView: some View {
        VStack {
            Text("Design The App")
                .font(.largeTitle)
                .padding(.bottom)
            HStack(alignment: .top) {
                VStack {
                    Text("101")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("minutes")
                        .font(.caption)
                }
                Text(":")
                    .font(.largeTitle)
                VStack {
                    Text("45")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("seconds")
                        .font(.caption)
                }
            }
        }
    }
    
    var actionbuttonsView: some View {
        HStack {
            Image(systemName: "stop.circle")
                .foregroundColor(.red)
                .font(Font.system(size: 32, weight: .bold))
            Image(systemName: "play.circle")
                .foregroundColor(.blue)
                .font(Font.system(size: 80, weight: .bold))
            Image(systemName: "pause.circle")
                .foregroundColor(.gray)
                .font(Font.system(size: 32, weight: .bold))
        }
        .padding()
    }
}

// MARK: - Preview

struct TaskDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailsView()
    }
}
