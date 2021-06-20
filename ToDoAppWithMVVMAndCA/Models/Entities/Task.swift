//
//  Task.swift
//  ToDoAppWithMVVMAndCA
//
//  Created by 大西玲音 on 2021/06/19.
//

import Foundation
import RealmSwift

final class Task: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var isChecked: Bool = false
}
