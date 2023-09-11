//
//  PersistenceController.swift
//  TaskManager
//
//  Created by thaxz on 10/09/23.
//

import Foundation
import CoreData

class PersistenceController {
    
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        // creating and loading container from my xcdatamodel file
        self.container = NSPersistentContainer(name: "TaskManager")
        if inMemory {
            // telling coreData to dont use an extra file as were just testing
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { description, error in
            if let error = error as NSError? {
                // Change it if its going to production
                fatalError("Error loading container \(error), \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: SwiftUI Preview Helper
    
    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)
        let context = controller.container.viewContext
        // creating mock tasks
        for index in 0..<10 {
            let task = CDTask(title: "Mock Task nº \(index)", dueDate: Date(), context: context)
        }
        
        let doneTask = CDTask(title: "Done", dueDate: Date(), context: context)
        doneTask.isCompleted.toggle()
        
        return controller
    }()
    
}
