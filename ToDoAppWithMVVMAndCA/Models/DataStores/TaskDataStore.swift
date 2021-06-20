//
//  RealmDataStore.swift
//  ToDoAppWithMVVMAndCA
//
//  Created by 大西玲音 on 2021/06/20.
//

import Foundation
import RealmSwift

final class TaskDataStore {
    
    private let realm = try! Realm()
    var objects: Results<Task> {
        realm.objects(Task.self)
    }
    
    func create(task: Task) {
        try! realm.write {
            realm.add(task)
        }
    }
    
    func read(index: Int) -> Task {
        let task = objects[index]
        return task
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
    
}
