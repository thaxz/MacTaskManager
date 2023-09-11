//
//  CDTaskGroup+Helper.swift
//  TaskManager
//
//  Created by thaxz on 10/09/23.
//

import Foundation
import CoreData

// MARK: Extending to make this attributes non-optional

extension CDTaskGroup {
    
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
    
    var creationDate: Date {
        creationDate_ ?? Date()
    }
    
    var tasks: Set<CDTask> {
        get {(tasks as? Set<CDTask>) ?? []}
        set {tasks_ = newValue as NSSet}
    }
    
    // Convenience init
    convenience init(title: String, context: NSManagedObjectContext){
        self.init(context: context)
        self.title = title
    }
    
    // Called every time this object is created
    public override func awakeFromInsert() {
        self.uuid_ = UUID()
        self.creationDate_ = Date()
    }
    
    //MARK: CRUD
    
    // Delete
    static func delete(taskGroup: CDTaskGroup){
        guard let context = taskGroup.managedObjectContext else {return}
        context.delete(taskGroup)
    }
    
    // Fetch
    static func fetch(_ predicate: NSPredicate = .all) -> NSFetchRequest<CDTaskGroup> {
        let request = CDTaskGroup.fetchRequest()
        // sorting tasks by the dueDate
        // if two objects shares the same Date, it's sorted by name
        request.sortDescriptors = [NSSortDescriptor(keyPath: \CDTaskGroup.title_, ascending: true), NSSortDescriptor(keyPath: \CDTaskGroup.creationDate_, ascending: true)
        ]
        request.predicate = predicate
        return request
    }
    
    // MARK: Preview Helper
    static var mockTest: CDTaskGroup {
        let context = PersistenceController.preview.container.viewContext
        let taskGroup = CDTaskGroup(title: "Eras Tour", context: context)
        taskGroup.tasks.insert(CDTask.mockTest)
        return taskGroup
    }
    
}
