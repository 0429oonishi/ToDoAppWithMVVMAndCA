//
//  AdditionalTaskViewController.swift
//  ToDoAppWithMVVMAndCA
//
//  Created by 大西玲音 on 2021/06/19.
//

import UIKit

final class AdditionalTaskViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
