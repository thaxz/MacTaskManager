//
//  TaskListView.swift
//  TaskManager
//
//  Created by thaxz on 08/09/23.
//

import SwiftUI
import CoreData

struct TaskListView: View {
    
    let title: String
    // Fetching all tasks from coredata
    @FetchRequest(fetchRequest: CDTask.fetch(), animation: .easeIn) var tasks
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        List(tasks){ task in
            TaskRow(task: task)
        }.toolbar {
            Button {
                _ = CDTask(title: "New", dueDate: Date(), context: context)
            } label: {
                Label("Add new task", systemImage: "plus")
            }

        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView(title: "all")
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
