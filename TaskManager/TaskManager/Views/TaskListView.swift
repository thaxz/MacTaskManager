//
//  TaskListView.swift
//  TaskManager
//
//  Created by thaxz on 08/09/23.
//

import SwiftUI

struct TaskListView: View {
    
    let title: String
    let tasks: [Task]
    
    var body: some View {
        List(tasks){ task in
            HStack {
                Image(systemName: task.isCompleted ? "largecircle.fill.circle" : "circle")
                Text(task.title)
            }
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView(title: "all", tasks: Task.examples())
    }
}
