//
//  TasksManager.swift
//  ToDoListApp
//
//  Created by Marlon Gabriel Flores Ramos on 11/05/23.
//

import Foundation

class TasksManager {
    
    static let shared = TasksManager()
    
    var tasks: [Task] = []
    
    private init() { }
    
    func addTask(task: Task) {
        tasks.append(task)
    }
    
    func updateTask(id: UUID, task: Task) {
//        tasks.filter { $0.id == id }
    }
    
    func getPendingTasks() -> [Task] {
        return tasks.filter { $0.status != .finish}
    }
    
    func getCompletedTasks() -> [Task] {
        return tasks.filter { $0.status == .finish}
    }
    
}
