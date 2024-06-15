//
//  TaskSection.swift
//  TaskManager
//
//  Created by Mayank Srivastava on 12/06/24.
//

import Foundation

enum TaskSection: Identifiable, CaseIterable, Hashable {
    
    
    
    case all, done, upcomming, list(TaskGroup)
    
    var id: String {
        switch self {
        case .all:
            return "All"
        case .done:
            return "Done"
        case .upcomming:
            return "Upcomming"
        case .list(let group):
            return group.id.uuidString
        }
    }
    
    var displayName: String {
        switch self {
        case .all:
            "All"
        case .done:
            "Done"
        case .upcomming:
            "Upcomming"
        case .list(let group):
            group.title
        }
    }
    
    var iconName: String {
        switch self {
        case .all:
            "star"
        case .done:
            "checkmark.circle"
        case .upcomming:
            "calendar"
        case .list(_):
            "folder"
        }
    }
    
    var iconName1: String {
        switch self {
        case .all:
            "star"
        case .done:
            "checkmark.circle"
        case .upcomming:
            "calendar"
        case .list(_):
            "folder"
        }
    }
    
    static var allCases: [TaskSection] {
        [.all, .done, .upcomming, ]
    }
    
    static func == (lhs: TaskSection, rhs: TaskSection) -> Bool {
        lhs.id == rhs.id
    }
}
