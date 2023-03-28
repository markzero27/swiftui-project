//
//  ContentView.swift
//  swiftui-project
//
//  Created by Mark Daquis on 3/26/23.
//

import SwiftUI
import CoreData

struct TaskListView: View {
    
    // MARK: - Properties
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Item.timeStamp, ascending: true)
        ],
        animation: .default
    ) private var taskList: FetchedResults<Item>
    
    @State private var isPresented: Bool = false
    @State private var refreshID = UUID()
    
    // MARK: - Body

    var body: some View {
        ScrollView {
            VStack(spacing: .zero) {
                ForEach(taskList) { item in
                    NavigationLink {
                        TaskDetailsView(taskItem: item)
                    } label: {
                        TaskItemView(taskItem: item)
                    }
                    .listRowSeparator(.hidden)
                    Divider()
                        .opacity(0.5)
                }
            }
            .padding()
        }
        .toolbar {
            ToolbarItem {
                Button {
                    isPresented.toggle()
                } label: {
                    Image(systemName: "plus")
                        .font(Font.system(size: 20, weight: .bold))
                }
            }
        }
        .navigationTitle(Text("Daily Tasks"))
        .embedNAvigationView()
        .fullScreenCover(isPresented: $isPresented) {
            ConfigureEventView()
        }
    }

}

// MARK: - Preview
struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
