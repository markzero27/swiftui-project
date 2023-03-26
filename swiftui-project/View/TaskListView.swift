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
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var taskList: FetchedResults<Item>
    
    @State private var isPresented: Bool = false

    // MARK: - Body

    var body: some View {
        ScrollView {
            VStack(spacing: .zero) {
                ForEach(taskList) { item in
                    NavigationLink {
                        TaskDetailsView()
                    } label: {
                        TaskItemView()
                    }
                    .listRowSeparator(.hidden)
                    Divider()
                        .opacity(0.5)
                }
                .onDelete(perform: deleteItems)
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

// MARK: - Private Functions

private extension TaskListView {
    
    func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { taskList[$0] }.forEach(viewContext.delete)
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
}

// MARK: - Preview
struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
