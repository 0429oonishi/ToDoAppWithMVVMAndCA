//
//  EditTaskViewController.swift
//  ToDoAppWithMVVMAndCA
//
//  Created by 大西玲音 on 2021/06/19.
//

import UIKit

class EditTaskViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    static func instantiate() -> EditTaskViewController {
        let EditTaskVC = UIStoryboard.additionalTask.instantiateViewController(
            withIdentifier: .additionalTaskIdentifier
        ) as! EditTaskViewController
        return EditTaskVC
    }
    
}

private extension UIStoryboard {
    static var additionalTask: UIStoryboard {
        return UIStoryboard(name: "AdditionalTask", bundle: nil)
    }
}

private extension String {
    static let additionalTaskIdentifier = "AdditionalTaskViewController"
}
