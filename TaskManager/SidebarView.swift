//
//  SidebarView.swift
//  TaskManager
//
//  Created by Mayank Srivastava on 13/06/24.
//

import SwiftUI

struct SidebarView: View {
    @Binding var selection: TaskSection
    @Binding var userCreatedGroup: [TaskGroup]
    
    
    var body: some View {
        List(selection: $selection) {
            Section("Favorites") {
                ForEach(TaskSection.allCases) { selection in
                    Label(selection.displayName, systemImage: selection.iconName).tag(selection)
                }
            }
            Section("Your Groups") {
                ForEach($userCreatedGroup) { $group in
                    HStack {
                        Image(systemName: "folder")
                        TextField("Add New", text: $group.title)
                    }
                        .tag(TaskSection.list(group))
                        .contextMenu {
                            Button("Delete") {
                                if let index = userCreatedGroup.firstIndex(where: { $0.id == $group.id
                                }) {
                                    userCreatedGroup.remove(at: index)
                                }
                            }
                        }
                }
            }
                        
        }
        .safeAreaInset(edge: .bottom) {
            Button(action: {
                let newGroup = TaskGroup(title: "New Group")
                userCreatedGroup.append(newGroup)
                
            }, label: {
                Label("Add Group", systemImage: "plus.circle")
            })
            .buttonStyle(.borderless)
            .foregroundColor(.accentColor)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .keyboardShortcut(KeyEquivalent("a"), modifiers: .command)
        }
        
    }
}

#Preview {
    SidebarView(selection: .constant(.all), userCreatedGroup: .constant(TaskGroup.examples())).listStyle(.sidebar)
}
