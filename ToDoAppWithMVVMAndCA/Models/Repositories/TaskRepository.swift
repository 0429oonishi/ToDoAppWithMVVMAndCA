//
//  TaskRepository.swift
//  ToDoAppWithMVVMAndCA
//
//  Created by 大西玲音 on 2021/06/20.
//

import Foundation

protocol TaskRepositoryProtocol {
    func create(task: Task)
    func read(index: Int) -> Task
    func readAll() -> [Task]
    func update(task: Task, index: Int)
    func delete(index: Int)
    func deleteAll()
}

final class TaskRepositoryImpl: TaskRepositoryProtocol {
    
    private let dataStore = TaskDataStore()
    
    func create(task: Task) {
        dataStore.create(task: task)
    }
    
    func read(index: Int) -> Task {
        return dataStore.read(index: index)
    }
    
    func readAll() -> [Task] {
        return dataStore.objects.map { $0 }
    }
    
    func update(task: Task, index: Int) {
        dataStore.update(task: task, index: index)
    }
    
    func delete(index: Int) {
        dataStore.delete(index: index)
    }
    
    func deleteAll() {
        (0..<dataStore.objects.count).forEach { index in
            dataStore.delete(index: index)
        }
    }
    
}
