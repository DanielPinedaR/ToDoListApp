//
//  TasksManager.swift
//  ToDoListApp
//
//  Created by Marlon Gabriel Flores Ramos on 11/05/23.
//

import Foundation

class TasksManager {
    
    static let shared = TasksManager()
    
    var tasks: [Task] = [
        Task(title: "Title1", description: "Desc", status: .pending),
        Task(title: "Title2", description: "Desc", status: .finish),
        Task(title: "Title3", description: "Desc", status: .pending),
    ]
    
    var completedTasks: [Task] {
        return tasks.filter { $0.status == .finish }
    }
    
    var pendingTasks: [Task] {
        return tasks.filter { $0.status != .finish }
    }
    
    private init() { }
    
    func addTask(task: Task) {
        tasks.append(task)
    }
    
    func updateTask(id: UUID, task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks[index] = task
        }
    }
    
    func getPendingTasks() -> [Task] {
        return tasks.filter { $0.status != .finish}
    }
    
    func getCompletedTasks() -> [Task] {
        return tasks.filter { $0.status == .finish}
    }
    
}
