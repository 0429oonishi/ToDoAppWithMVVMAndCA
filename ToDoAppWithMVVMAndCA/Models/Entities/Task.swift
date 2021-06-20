//
//  Task.swift
//  ToDoAppWithMVVMAndCA
//
//  Created by 大西玲音 on 2021/06/19.
//

import Foundation
import RealmSwift

// 共通型
struct Task {
    var title: String
    var isChecked: Bool
}

// Realmに依存した型
final class RealmTask: Object {
    @objc dynamic var title = ""
    @objc dynamic var isChecked = false
}
