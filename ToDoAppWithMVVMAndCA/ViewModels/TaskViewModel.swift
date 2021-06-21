//
//  TaskViewModel.swift
//  ToDoAppWithMVVMAndCA
//
//  Created by 大西玲音 on 2021/06/21.
//

import Foundation
import RxSwift
import RxCocoa

protocol TaskViewModelInput {
    func checkButtonDidTapped(index: Int, handler: () -> Void)
}

protocol TaskViewModelOutput: AnyObject {
    func goAdditionalTaskVC(handler: () -> Void)
}

protocol TaskViewModelType {
    var inputs: TaskViewModelInput { get }
    var outputs: TaskViewModelOutput { get }
}

final class TaskViewModel: TaskViewModelInput, TaskViewModelOutput {
    
    private let taskUseCase = TaskUseCase(TaskRepositoryImpl())
    
    private let goAdditionalTaskVCRelay = PublishRelay<Void>()
    func goAdditionalTaskVC(handler: () -> Void) {
        goAdditionalTaskVCRelay.accept(handler())
    }
    
    func checkButtonDidTapped(index: Int, handler: () -> Void) {
        taskUseCase.toggleCheck(at: index)
        handler()
    }
    
    var taskCount: Int {
        return taskUseCase.count()
    }
    
    func task(at index: Int) -> Task {
        return taskUseCase.read(at: index)
    }
    
    func update(_ text: String, at index: Int) {
        taskUseCase.update(text, at: index)
    }
    
    func delete(at index: Int) {
        taskUseCase.delete(at: index)
    }
    
    func add(text: String) {
        taskUseCase.add(text: text)
    }
    
}

extension TaskViewModel {
    
    var inputs: TaskViewModelInput {
        return self
    }
    
    var outputs: TaskViewModelOutput {
        return self
    }
    
}

