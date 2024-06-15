//
//  ContentView.swift
//  TaskManager
//
//  Created by Mayank Srivastava on 12/06/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userCreatedGroup = TaskGroup.examples()
    @State private var allTasks = Task.examples()
    @State private var selection = TaskSection.all
    @State private var searchTerm = ""
    var body: some View {
        NavigationSplitView {
            SidebarView(selection: $selection, userCreatedGroup: $userCreatedGroup)
            
        } detail: {
            if searchTerm.isEmpty {
                switch selection {
                case .all:
                    TaskListView(title: "All", tasks: $allTasks)
                case .done:
                    StaticTaskListView(title: selection.displayName, tasks: allTasks.filter({ $0.isCompleted
                    }))
                case .upcomming:
                    StaticTaskListView(title: selection.displayName, tasks: allTasks.filter({ !$0.isCompleted
                    }))
                case .list(let taskGroup):
                    StaticTaskListView(title: taskGroup.title, tasks: taskGroup.tasks)
                    
                }
            } else {
                StaticTaskListView(title: "All", tasks: allTasks.filter({$0.title.lowercased().contains(searchTerm)}))
            }
            
        }
        .searchable(text: $searchTerm, placement: .toolbar)
    }
}

#Preview {
    ContentView()
}
