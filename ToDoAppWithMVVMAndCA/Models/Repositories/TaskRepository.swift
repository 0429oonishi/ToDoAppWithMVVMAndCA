//
//  TaskRepository.swift
//  ToDoAppWithMVVMAndCA
//
//  Created by 大西玲音 on 2021/06/20.
//

import Foundation

// 共通型
protocol TaskRepositoryProtocol {
    func create(task: Task)
    func read(index: Int) -> Task
    func readAll() -> [Task]
    func update(task: Task, index: Int)
    func delete(index: Int)
    func deleteAll()
}
