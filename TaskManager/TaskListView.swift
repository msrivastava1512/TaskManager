//
//  TaskListView.swift
//  TaskManager
//
//  Created by Mayank Srivastava on 14/06/24.
//

import SwiftUI

struct TaskListView: View {
    
    let title: String
    @Binding var tasks: [Task]
    @State private var inspectorIsShown: Bool = false
    @State private var selectedTask: Task?
    
    var body: some View {
        List($tasks) { $task in
            HStack {
                TaskView(task: $task, selectedTask: $selectedTask, inspectorIsShown: $inspectorIsShown)
            }
        }
        .navigationTitle(title)
        .toolbar {

            ToolbarItemGroup {
                Button {
                    let newTask = Task(title: "New Task")
                    tasks.append(newTask)
                } label: {
                    Label("Add new task", systemImage: "plus")
                }
                Button {
                    inspectorIsShown.toggle()
                } label: {
                    Label("Show Inspector", systemImage: "sidebar.right")
                }
            }
        }
        .inspector(isPresented: $inspectorIsShown) {
            Group {
                if let task = selectedTask {
                    Text(task.title).font(.title)
                } else {
                    Text("No selected task")
                }
            }
            .frame(minWidth: 100, maxWidth: .infinity)
        }
    }
}

#Preview {
    TaskListView(title: "All", tasks: .constant(Task.examples()))
}

