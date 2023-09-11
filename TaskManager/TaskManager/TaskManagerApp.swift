//
//  TaskManagerApp.swift
//  TaskManager
//
//  Created by thaxz on 08/09/23.
//

import SwiftUI

@main
struct TaskManagerApp: App {
    
    let persistentController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            CommandMenu("Task") {
                Button("Add New Task") {
                    
                }
                .keyboardShortcut(KeyEquivalent("r"), modifiers: .command)
            }
            
            CommandGroup(after: .newItem) {
                Button("Add New Group") {
                    
                }
            }
        }
    }
}
