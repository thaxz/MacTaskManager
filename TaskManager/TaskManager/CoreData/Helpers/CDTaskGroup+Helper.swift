//
//  CDTaskGroup+Helper.swift
//  TaskManager
//
//  Created by thaxz on 10/09/23.
//

import Foundation

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
    
}
