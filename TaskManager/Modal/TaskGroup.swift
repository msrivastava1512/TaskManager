//
//  TaskGroup.swift
//  TaskManager
//
//  Created by Mayank Srivastava on 12/06/24.
//

import Foundation

struct TaskGroup: Identifiable, Hashable {
    var id = UUID()
    var title: String
    let creationDate: Date
    var tasks: [Task]
    
    init(title: String, creationDate: Date = Date(), tasks: [Task] = []) {
        self.title = title
        self.creationDate = creationDate
        self.tasks = tasks
    }
    
    static func example() -> TaskGroup {
        let task1 = Task(title: "Buy groceries")
        let task2 = Task(title: "Finish project")
        let task3 = Task(title: "Call dentist")
        let array = [task1, task2, task3]
        let taskGroup = TaskGroup(title: "Personal", tasks: array)
        return taskGroup
    }
    
    static func examples() -> [TaskGroup] {
        let group1 = example()
        let group2 = TaskGroup(title: "New List")
        return [group1, group2]
    }
}
