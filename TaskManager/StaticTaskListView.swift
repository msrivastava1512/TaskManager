//
//  TaskListView.swift
//  TaskManager
//
//  Created by Mayank Srivastava on 13/06/24.
//

import SwiftUI

struct StaticTaskListView: View {
    
    let title: String
    let tasks: [Task]
    
    var body: some View {
        List(tasks) { task in
            HStack {
                Image(systemName: task.isCompleted ? "largecircle.fill.circle": "circle" )
                Text(task.title)
            }
            
        }
    }
}

#Preview {
    StaticTaskListView(title: "All", tasks: Task.examples())
}
