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
    
    init(title: String, selection: TaskSection?) {
        self.title = title
        var request = CDTask.fetch()
        switch selection {
        case .all:
            request.predicate = nil
        case .done:
            request.predicate = NSPredicate(format: "isCompleted == true")
        case .upcoming:
            request.predicate = NSPredicate(format: "isCompleted == false")
        case .list(let CDTaskGroup):
            request.predicate = nil
        case nil:
            request.predicate = .none
        }
        self._tasks = FetchRequest(fetchRequest: request)
    }
    
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
        TaskListView(title: "all", selection: .done)
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
