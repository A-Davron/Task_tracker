//
//  TaskDataManager.swift
//  TodoList
//
//  Created by Bilol Abdilxayev on 23/04/25.
//

import Foundation

class TaskDataManager {
    static let shared = TaskDataManager()
    private let userDefaultsKey = "persistedTasks"
    
    var activeTasks: [Task] = [] {
        didSet { saveTasks() }
    }
    var completedTasks: [Task] = [] {
        didSet { saveTasks() }
    }
    
    private init() {
        loadTasks()
    }
    
    private func saveTasks() {
        let allTasks = ["active": activeTasks, "completed": completedTasks]
        if let encoded = try? JSONEncoder().encode(allTasks) {
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
        }
    }
    
    private func loadTasks() {
        if let data = UserDefaults.standard.data(forKey: userDefaultsKey),
           let decoded = try? JSONDecoder().decode([String: [Task]].self, from: data) {
            activeTasks = decoded["active"] ?? []
            completedTasks = decoded["completed"] ?? []
        }
    }
    
    func completeTask(at index: Int) {
        guard index < activeTasks.count else { return }
        let task = activeTasks.remove(at: index)
        completedTasks.append(task)
    }
    
    func deleteActiveTask(at index: Int) {
        guard index < activeTasks.count else { return }
        activeTasks.remove(at: index)
    }
    
    func deleteCompletedTask(at index: Int) {
        guard index < completedTasks.count else { return }
        completedTasks.remove(at: index)
    }
    
    func sortTasks() {
        activeTasks.sort { $0.priority > $1.priority }
    }
}
