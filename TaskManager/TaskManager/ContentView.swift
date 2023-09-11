//
//  ContentView.swift
//  TaskManager
//
//  Created by thaxz on 08/09/23.
//

import SwiftUI

struct ContentView: View {
    
    let persistentController = PersistenceController.shared
    
    @State private var selection = TaskSection.all
    @State private var userCreatedGroups: [TaskGroup] = TaskGroup.examples()
    @State private var allTasks = Task.examples()
    
    @State private var searchTerm: String = ""
    
    var body: some View {
        NavigationSplitView {
            SideBarView(selection: $selection)
        } detail: {
            if searchTerm.isEmpty {
                switch selection {
                case .all:
                    TaskListView(title: "All")
                case .done:
                    StaticTaskListView(title: "Done", tasks: allTasks.filter({$0.isCompleted}))
                case .upcoming:
                    StaticTaskListView(title: "Upcoming", tasks: allTasks.filter({!$0.isCompleted}))
                case .list(let taskGroup):
//                    StaticTaskListView(title: taskGroup.title, tasks: taskGroup.tasks)
                    Text("placeholder")
                }
            } else {
                StaticTaskListView(title: "Done", tasks: allTasks.filter({$0.title.contains(searchTerm)}))
            }
        }
        .searchable(text: $searchTerm)
        .environment(\.managedObjectContext, persistentController.container.viewContext)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
