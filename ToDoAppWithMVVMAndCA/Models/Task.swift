//
//  Task.swift
//  ToDoAppWithMVVMAndCA
//
//  Created by 大西玲音 on 2021/06/19.
//

import Foundation

struct Task {
    var title: String
    var isChecked: Bool
    static let testData = [Task(title: "AAA", isChecked: false),
                           Task(title: "BBB", isChecked: false),
                           Task(title: "CCC", isChecked: false),
                           Task(title: "DDD", isChecked: false),
                           Task(title: "EEE", isChecked: false),
    ]
}
