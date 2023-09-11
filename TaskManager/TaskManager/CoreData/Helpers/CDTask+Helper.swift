//
//  CDTask+Helper.swift
//  TaskManager
//
//  Created by thaxz on 10/09/23.
//

import Foundation
import CoreData

// MARK: Extending to make this attributes non-optional

extension CDTask {
    
    
    var uuid: UUID {
        // If it's on simulator
        #if DEBUG
        uuid_!
        #else
        uuid_ ?? UUID()
        #endif
    }
    
    // get and set because this property is supposed to change
    var title: String {
        get { title_ ?? ""}
        set { title_ = newValue }
    }
    
    var dueDate: Date{
        get { dueDate_ ?? Date() }
        set { dueDate_ = newValue }
    }
    
    // Convenience init
    convenience init(title: String, dueDate: Date, context: NSManagedObjectContext){
        self.init(context: context)
        self.title = title
        self.dueDate = dueDate
    }
    
    // Called every time this object is created
    public override func awakeFromInsert() {
        self.uuid_ = UUID()
    }
    
    // Delete
    static func delete(task: CDTask){
        guard let context = task.managedObjectContext else {return}
        context.delete(task)
    }
    
    // MARK: Preview Helper
    static var mockTest: CDTask {
        let context = PersistenceController.preview.container.viewContext
        let task = CDTask(title: "Listen to Folklore", dueDate: Date(), context: context)
        return task
    }
    
}
