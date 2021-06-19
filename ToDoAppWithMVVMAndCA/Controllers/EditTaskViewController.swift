//
//  EditTaskViewController.swift
//  ToDoAppWithMVVMAndCA
//
//  Created by 大西玲音 on 2021/06/19.
//

import UIKit

final class EditTaskViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    static func instantiate() -> EditTaskViewController {
        let editTaskVC = UIStoryboard.editTask.instantiateViewController(
            withIdentifier: .editTaskVCIdentifier
        ) as! EditTaskViewController
        return editTaskVC
    }
    
}

private extension UIStoryboard {
    static var editTask: UIStoryboard {
        return UIStoryboard(name: "EditTask", bundle: nil)
    }
}

private extension String {
    static let editTaskVCIdentifier = "EditTaskViewController"
}
