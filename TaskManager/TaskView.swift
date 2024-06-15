//
//  TaskView.swift
//  TaskManager
//
//  Created by Mayank Srivastava on 14/06/24.
//

import SwiftUI

struct TaskView: View {
    
    @Binding var task: Task
    @Binding var selectedTask: Task?
    @Binding var inspectorIsShown: Bool
    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "largecircle.fill.circle": "circle" )
                .onTapGesture {
                    task.isCompleted.toggle()
                }
            TextField(task.title, text: $task.title)
                .textFieldStyle(.plain)
            
            Button(action: {
                selectedTask = task
                inspectorIsShown = true
            }, label: {
                Text("More")
            })
            
        }
    }
}

#Preview {
    TaskView(task: .constant(Task.example()), selectedTask: .constant(nil), inspectorIsShown: .constant(false))
}
