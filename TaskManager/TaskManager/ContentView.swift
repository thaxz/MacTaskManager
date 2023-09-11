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
            SideBarView(selection: $selection)
        } detail: {
            if searchTerm.isEmpty {
                    TaskListView(title: "All", selection: selection)
            } else {
                StaticTaskListView(title: "All", tasks: allTasks.filter({$0.title.contains(searchTerm)}))
            }
        }
        .searchable(text: $searchTerm)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
