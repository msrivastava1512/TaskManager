//
//  TaskManagerApp.swift
//  TaskManager
//
//  Created by Mayank Srivastava on 12/06/24.
//

import SwiftUI

@main
struct TaskManagerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.commands {
            CommandMenu("Task") {
                Button("Add new Task") {
                    
                }
                .keyboardShortcut(KeyEquivalent("r"), modifiers: /*@START_MENU_TOKEN@*/.command/*@END_MENU_TOKEN@*/)
            }
            
            CommandGroup(after: .newItem) {
                Button("Add new group") {
                    
                }
            }
        }
        WindowGroup("Special Window") {
            Text("This is a special Window")
                .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100)
        }
        .defaultPosition(.center)
        
        Settings {
            Text("Settings")
                .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity)
        }
        
        MenuBarExtra("Do some thing here") {
            
        }
    }
}
