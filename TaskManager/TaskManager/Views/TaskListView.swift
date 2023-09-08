//
//  TaskListView.swift
//  TaskManager
//
//  Created by thaxz on 08/09/23.
//

import SwiftUI

struct TaskListView: View {
    let title: String
    @Binding var tasks: [Task]
    
    var body: some View {
        List($tasks){ $task in
            TaskView(task: $task)
        }.toolbar {
            Button {
                tasks.append(Task(title: "New task!"))
            } label: {
                Label("Add new task", systemImage: "plus")
            }

        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView(title: "all", tasks: .constant(Task.examples()))
    }
}
