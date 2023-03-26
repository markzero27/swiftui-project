//
//  ContentView.swift
//  swiftui-project
//
//  Created by Mark Daquis on 3/26/23.
//

import SwiftUI
import CoreData

struct MainView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    @State private var isPresented: Bool = false

    var body: some View {
        ScrollView {
            VStack(spacing: .zero) {
                ForEach(items) { item in
                    NavigationLink {
                        TaskItemDetailsView()
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
            .fullScreenCover(isPresented: $isPresented) {
                ConfigureEventView()
            }
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
        
    }


    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
