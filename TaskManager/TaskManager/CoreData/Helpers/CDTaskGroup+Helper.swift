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
    
}
