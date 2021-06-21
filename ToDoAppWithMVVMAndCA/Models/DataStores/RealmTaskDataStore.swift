//
//  RealmTaskDataStore.swift
//  ToDoAppWithMVVMAndCA
//
//  Created by 大西玲音 on 2021/06/20.
//

import Foundation
import RealmSwift

final class RealmTaskDataStore: TaskDataStoreProtocol {
    
    private let realm = try! Realm()
    private var objects: Results<RealmTask> {
        realm.objects(RealmTask.self)
    }
    
    func create(task: Task) {
        let realmTask = RealmTask(task: task)
        try! realm.write {
            realm.add(realmTask)
        }
    }
    
    func read(index: Int) -> Task {
        let task = Task(task: objects[index])
        return task
    }
    
    func readAll() -> [Task] {
        return objects.map { Task(task: $0) }
    }
    
    func update(task: Task, index: Int) {
        let object = objects[index]
        try! realm.write {
            object.title = task.title
            object.isChecked = task.isChecked
        }
    }
    
    func delete(index: Int) {
        let task = objects[index]
        try! realm.write {
            realm.delete(task)
        }
    }
    
    func deleteAll() {
        for object in objects {
            try! realm.write {
                realm.delete(object)
            }
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



