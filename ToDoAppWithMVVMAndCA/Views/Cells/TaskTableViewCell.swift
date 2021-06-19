//
//  TaskTableViewCell.swift
//  ToDoAppWithMVVMAndCA
//
//  Created by 大西玲音 on 2021/06/19.
//

import UIKit

final class TaskTableViewCell: UITableViewCell {

    @IBOutlet private weak var checkButton: UIButton!
    @IBOutlet private weak var taskLabel: UILabel!
    
    static var identifier: String { String(describing: self) }
    static var nib: UINib { UINib(nibName: String(describing: self), bundle: nil) }
    var checkButtonDidTapped: (() -> Void)?
    
    @IBAction private func checkButtonDidTapped(_ sender: Any) {
        checkButtonDidTapped?()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        checkButton.setImage(UIImage(systemName: "circle"), for: .normal)
        
    }
    
    func configure(task: Task, checkButtonDidTapped: (() -> Void)?) {
        taskLabel.text = task.title
        checkButton.setImage(
            UIImage(systemName: { task.isChecked ? "circle.fill" : "circle" }()),
            for: .normal
        )
        self.checkButtonDidTapped = checkButtonDidTapped
    }
    
}
