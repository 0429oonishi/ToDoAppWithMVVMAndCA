//
//  RealmTaskRepository.swift
//  ToDoAppWithMVVMAndCA
//
//  Created by 大西玲音 on 2021/06/21.
//

import Foundation

// 何にも依存しないTaskRepositoryImpl
final class TaskRepositoryImpl: TaskRepositoryProtocol {
    
    private let dataStore = RealmTaskDataStore()
    
    func create(task: Task) {
        dataStore.create(task: task)
    }
    
    func read(index: Int) -> Task {
        return dataStore.read(index: index)
    }
    
    func readAll() -> [Task] {
        return dataStore.readAll()
    }
    
    func update(task: Task, index: Int) {
        dataStore.update(task: task, index: index)
    }
    
    func delete(index: Int) {
        dataStore.delete(index: index)
    }
    
    func deleteAll() {
        dataStore.deleteAll()
    }
    
}
