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
    
    @State private var searchTerm: String = ""
    
    var body: some View {
        NavigationSplitView {
            SideBarView(userCreatedGroups: $userCreatedGroups, selection: $selection)
        } detail: {
            if searchTerm.isEmpty {
                switch selection {
                case .all:
                    TaskListView(title: "All", tasks: $allTasks)
                case .done:
                    StaticTaskListView(title: "Done", tasks: allTasks.filter({$0.isCompleted}))
                case .upcoming:
                    StaticTaskListView(title: "Upcoming", tasks: allTasks.filter({!$0.isCompleted}))
                case .list(let taskGroup):
                    StaticTaskListView(title: taskGroup.title, tasks: taskGroup.tasks)
                }
            } else {
                StaticTaskListView(title: "Done", tasks: allTasks.filter({$0.title.contains(searchTerm)}))
            }
        }
        .searchable(text: $searchTerm)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
