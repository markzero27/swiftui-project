//
//  TaskItemListView.swift
//  swiftui-project
//
//  Created by Mark Daquis on 3/26/23.
//

import SwiftUI

struct ConfigureEventView: View {
    
    // MARK: - Properties
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) var dismiss
    @ObservedObject private var viewModel: ConfigureEventViewModel
    @FetchRequest(
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Item.timeStamp, ascending: true)
        ],
        animation: .default
    ) private var taskList: FetchedResults<Item>
    
    // MARK: - Initialization
    
    init(taskItem: Item? = nil) {
        viewModel = ConfigureEventViewModel(task: taskItem)
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            if viewModel.id != nil {
                deleteButtonView
            }
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
        TextField("Title", text: $viewModel.title)
            .borderBoxStyle()
    }
    
    var timePickerView: some View {
        HStack(spacing: 5) {
            Image(systemName: "clock")
            Text("Length")
            Spacer()
            TextField("Minutes", text: Binding<String>(
                get: { String(viewModel.length) },
                set: {
                    if let value = NumberFormatter().number(from: $0) {
                        viewModel.length = value.intValue
                    }
                }
            ))
                .multilineTextAlignment(.trailing)
                .padding(.trailing)
                .keyboardType(.numberPad)
        }
        .borderBoxStyle()
    }
    
    var themePickerView: some View {
        HStack(spacing: 5) {
            Image(systemName: "square.grid.2x2")
            Text("Theme")
            Spacer()
            themePickerButtonView
        }
        .borderBoxStyle()
    }
    
    var themePickerButtonView: some View {
        Picker("Pick a Color", selection: $viewModel.colorTheme) {
           ForEach(ColorTheme.allCases, id: \.self) { theme in
               HStack {
                   Image(systemName: "square.fill")
                       .foregroundStyle(theme.color, .blue)
               }
             
           }
       }
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
                save()
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
                deleteItem()
            } label: {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
            .padding()
        }
    }
    
}

// MARK: - Private functions

private extension ConfigureEventView {
    
    func save() {
        if viewModel.isNew {
            addTask()
        } else {
            updateTask()
        }
        dismissKeyboard()
        dismiss()
    }
    
    func addTask() {
        withAnimation {
            let newTask = Item(context: viewContext)
            newTask.id = UUID()
            newTask.timeStamp = Date()
            newTask.text = viewModel.title
            newTask.theme = viewModel.colorTheme
            newTask.length = Int16(viewModel.length)
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    func updateTask() {
        withAnimation {
            if let index = taskList.firstIndex(where: { $0.id == viewModel.id }) {
                viewContext.performAndWait {
                    let task = taskList[index]
                    task.text = viewModel.title
                    task.theme = viewModel.colorTheme
                    task.length = Int16(viewModel.length)
                    do {
                        try viewContext.save()
                    } catch {
                        let nsError = error as NSError
                        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                    }
                }
            }
        }
    }
    
    func deleteItem() {
        if let index = taskList.firstIndex(where: { $0.id == viewModel.id }) {
            self.viewContext.delete(taskList[index])
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

struct ConfigureEventView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigureEventView(taskItem: nil)
    }
}
