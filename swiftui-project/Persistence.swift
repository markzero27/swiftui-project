//
//  Persistence.swift
//  swiftui-project
//
//  Created by Mark Daquis on 3/26/23.
//

import CoreData

struct PersistenceController {
    // MARK: - Singleton
    static let shared = PersistenceController()

    // MARK: - Properties
    
    let container: NSPersistentContainer

    // MARK: - Initialization
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "swiftui_project")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    // MARK: - Preview
    
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for i in 0..<10 {
            let newItem = Item(context: viewContext)
            newItem.id = UUID()
            newItem.theme = .red
            newItem.length = 60
            newItem.text = "Item \(i)"
            newItem.timeStamp = Date()
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
}
