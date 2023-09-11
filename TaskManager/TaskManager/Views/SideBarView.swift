//
//  SideBarView.swift
//  TaskManager
//
//  Created by thaxz on 08/09/23.
//

import SwiftUI
import CoreData

struct SideBarView: View {
    
    // Getting context
    @Environment(\.managedObjectContext) var context
    // Fetching request from core data go get all taskGroups created by the user
    @FetchRequest(fetchRequest: CDTaskGroup.fetch(), animation: .easeIn)
    var taskGroups: FetchedResults<CDTaskGroup>
    
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
                ForEach(taskGroups){ group in
                    TaskGroupRow(taskGroup: group)
                        .tag(TaskSection.list(group))
                        .contextMenu{
                            Button("Delete", role: .destructive) {
                                // deleting the selected group
                                CDTaskGroup.delete(taskGroup: group)
                            }
                        }
                }
            }
        }
        .safeAreaInset(edge: .bottom) {
            Button {
                let newGroup = CDTaskGroup(title: "New", context: context)
            } label: {
                Label("Add Group", systemImage: "plus.circle")
            }.buttonStyle(.borderless)
                .foregroundColor(.accentColor)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .keyboardShortcut(KeyEquivalent("a"), modifiers: .command)
        }
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView(selection: .constant(.all))
            .listStyle(.sidebar)
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
