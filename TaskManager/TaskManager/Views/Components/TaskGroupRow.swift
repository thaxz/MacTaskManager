//
//  TaskGroupRow.swift
//  TaskManager
//
//  Created by thaxz on 11/09/23.
//

import SwiftUI

struct TaskGroupRow: View {
    
    @ObservedObject var taskGroup: CDTaskGroup
    
    var body: some View {
        HStack {
            Image(systemName: "folder")
            TextField("New Group", text: $taskGroup.title)
        }
    }
}

struct TaskGroupRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskGroupRow(taskGroup: CDTaskGroup.mockTest)
    }
}
