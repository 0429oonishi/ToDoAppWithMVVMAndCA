//
//  EditTaskViewController.swift
//  ToDoAppWithMVVMAndCA
//
//  Created by 大西玲音 on 2021/06/19.
//

import UIKit

final class EditTaskViewController: UIViewController {
    
    @IBOutlet private weak var textField: UITextField!
    
    var text: String?
    var editEvent: ((String) -> Void)?
    var deleteEvent: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.text = text
        
    }
    
    @IBAction private func editButtonDidTapped(_ sender: Any) {
        if let text = textField.text, !text.isEmpty {
            editEvent?(text)
        } else {
            deleteEvent?()
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func backButtonDidTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    static func instantiate(text: String) -> EditTaskViewController {
        let editTaskVC = UIStoryboard.editTask.instantiateViewController(
            withIdentifier: .editTaskVCIdentifier
        ) as! EditTaskViewController
        editTaskVC.text = text
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

 
