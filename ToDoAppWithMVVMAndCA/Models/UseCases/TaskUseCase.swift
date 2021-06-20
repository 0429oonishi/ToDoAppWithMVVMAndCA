//
//  TaskUseCase.swift
//  ToDoAppWithMVVMAndCA
//
//  Created by 大西玲音 on 2021/06/20.
//

import Foundation

final class TaskUseCase {
    
    private let repository: TaskRepositoryProtocol
    
    init(_ repository: TaskRepositoryProtocol) {
        self.repository = repository
    }
    
    func add(text: String) {
        let task = Task(title: text, isChecked: false)
        repository.create(task: task)
    }
    
    func toggleCheck(at index: Int) {
        let title = repository.read(index: index).title
        let isChecked = !repository.read(index: index).isChecked
        let task = Task(title: title, isChecked: isChecked)
        repository.update(task: task, index: index)
    }
    
    func read(at index: Int) -> Task {
        return repository.read(index: index)
    }
    
    func update(_ text: String, at index: Int) {
        let isChecked = repository.read(index: index).isChecked
        let task = Task(title: text, isChecked: isChecked)
        repository.update(task: task, index: index)
    }
    
    func delete(at index: Int) {
        repository.delete(index: index)
    }
    
    func count() -> Int {
        return repository.readAll().count
    }
    
}
