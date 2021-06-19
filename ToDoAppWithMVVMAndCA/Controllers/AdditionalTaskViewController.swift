//
//  AdditionalTaskViewController.swift
//  ToDoAppWithMVVMAndCA
//
//  Created by 大西玲音 on 2021/06/19.
//

import UIKit

protocol AdditionalTaskViewControllerDelegate: AnyObject {
    func addButtonDidTapped(text: String)
}

final class AdditionalTaskViewController: UIViewController {
    
    @IBOutlet private weak var textField: UITextField!

    weak var delegate: AdditionalTaskViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction private func addButtonDidTapped(_ sender: Any) {
        if let text = textField.text, !text.isEmpty {
            delegate?.addButtonDidTapped(text: text)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func backButtonDidTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    static func instantiate() -> AdditionalTaskViewController {
        let additionalTaskVC = UIStoryboard.additionalTask.instantiateViewController(
            withIdentifier: .additionalTaskVCIdentifier
        ) as! AdditionalTaskViewController
        return additionalTaskVC
    }
    
}

private extension UIStoryboard {
    static var additionalTask: UIStoryboard {
        return UIStoryboard(name: "AdditionalTask", bundle: nil)
    }
}

private extension String {
    static let additionalTaskVCIdentifier = "AdditionalTaskViewController"
}
