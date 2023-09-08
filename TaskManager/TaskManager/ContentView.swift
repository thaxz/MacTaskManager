//
//  ContentView.swift
//  TaskManager
//
//  Created by thaxz on 08/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = TaskSection.all
    @State private var userCreatedGroups: [TaskGroup] = TaskGroup.examples()
    @State private var allTasks = Task.examples()
    
    var body: some View {
        NavigationSplitView {
            SideBarView(userCreatedGroups: userCreatedGroups, selection: $selection)
        } detail: {
            
            switch selection {
            case .all:
                TaskListView(title: "All", tasks: allTasks)
            case .done:
                TaskListView(title: "Done", tasks: allTasks.filter({$0.isCompleted}))
            case .upcoming:
                TaskListView(title: "Upcoming", tasks: allTasks.filter({!$0.isCompleted}))
            case .list(let taskGroup):
                TaskListView(title: taskGroup.title, tasks: taskGroup.tasks)
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
