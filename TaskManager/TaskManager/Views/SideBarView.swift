//
//  SideBarView.swift
//  TaskManager
//
//  Created by thaxz on 08/09/23.
//

import SwiftUI

struct SideBarView: View {
    
    let userCreatedGroups: [TaskGroup]
    
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
                ForEach(userCreatedGroups){ group in
                    HStack {
                        Image(systemName: "folder")
                        Text(group.title)
                            .tag(TaskSection.list(group))
                    }
                }
            }
        }
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView(userCreatedGroups: TaskGroup.examples(), selection: .constant(.all))
            .listStyle(.sidebar)
    }
}
