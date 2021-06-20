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
    func addTaskButtonDidTapped(handler: () -> Void)
}

protocol TaskViewModelOutput: AnyObject {
    
}

protocol TaskViewModelType {
    var inputs: TaskViewModelInput { get }
    var outputs: TaskViewModelOutput { get }
}

final class TaskViewModel: TaskViewModelInput, TaskViewModelOutput {
    
    private let taskUseCase = TaskUseCase(RealmTaskRepositoryImpl())
    
    private let addTaskButtonRelay = PublishRelay<Void>()
    func addTaskButtonDidTapped(handler: () -> Void) {
        addTaskButtonRelay.accept(handler())
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

