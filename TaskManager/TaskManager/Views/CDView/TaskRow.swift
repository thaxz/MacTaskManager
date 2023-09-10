//
//  TaskRow.swift
//  TaskManager
//
//  Created by thaxz on 10/09/23.
//

import SwiftUI

struct TaskRow: View {
    
    @ObservedObject var task: CDTask
    
    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "largecircle.fill.circle" : "circle")
                .onTapGesture {
                    task.isCompleted.toggle()
                }
            TextField("New Task", text: $task.title)
                .textFieldStyle(.plain)
        }
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: CDTask.mockTest)
    }
}
