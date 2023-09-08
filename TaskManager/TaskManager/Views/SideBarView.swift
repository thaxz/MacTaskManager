//
//  SideBarView.swift
//  TaskManager
//
//  Created by thaxz on 08/09/23.
//

import SwiftUI

struct SideBarView: View {
    
    @Binding var userCreatedGroups: [TaskGroup]
    
    @Binding var selection: TaskSection
    
    var body: some View {
        List(selection: $selection){
            Section("Favorites") {
                ForEach(TaskSection.allCases){ selection in
                    Label(selection.iconName, systemImage: selection.iconName)
                        .tag(selection)
                }
            }
            
            Section("Your Groups") {
                ForEach($userCreatedGroups){ $group in
                    HStack {
                        Image(systemName: "folder")
                        TextField("New Group", text: $group.title)
                    }
                    Label(group.title, systemImage: "folder")
                        .tag(TaskSection.list(group))
                }
            }
        }
        .safeAreaInset(edge: .bottom) {
            Button {
                let newGroup = TaskGroup(title: "New Group")
                userCreatedGroups.append(newGroup)
            } label: {
                Label("Add Group", systemImage: "plus.circle")
            }.buttonStyle(.borderless)
                .foregroundColor(.accentColor)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
        }
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView(userCreatedGroups: .constant(TaskGroup.examples()), selection: .constant(.all))
            .listStyle(.sidebar)
    }
}
