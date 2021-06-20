//
//  RealmTaskRepository.swift
//  ToDoAppWithMVVMAndCA
//
//  Created by 大西玲音 on 2021/06/21.
//

import Foundation

// Realmに依存したRepositoryのImpl
final class RealmTaskRepositoryImpl: TaskRepositoryProtocol {
    
    private let dataStore = RealmTaskDataStore()
    
    func create(task: Task) {
        let realmTask = RealmTask(task: task)
        dataStore.create(task: realmTask)
    }
    
    func read(index: Int) -> Task {
        let task = dataStore.read(index: index)
        let realmTask = Task(task: task)
        return realmTask
    }
    
    func readAll() -> [Task] {
        return dataStore.objects.map { Task(task: $0) }
    }
    
    func update(task: Task, index: Int) {
        let realmTask = RealmTask(task: task)
        dataStore.update(task: realmTask, index: index)
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

private extension RealmTask {
    
    convenience init(task: Task) {
        self.init()
        self.isChecked = task.isChecked
        self.title = task.title
    }
    
}

private extension Task {
    
    init(task: RealmTask) {
        self.isChecked = task.isChecked
        self.title = task.title
    }
    
}


