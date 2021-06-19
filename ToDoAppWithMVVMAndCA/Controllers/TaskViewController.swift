//
//  TaskViewController.swift
//  ToDoAppWithMVVMAndCA
//
//  Created by 大西玲音 on 2021/06/19.
//

import UIKit

final class TaskViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    private var testData = Task.testData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(TaskTableViewCell.nib,
                           forCellReuseIdentifier: TaskTableViewCell.identifier)
    }
    
    @IBAction private func addTaskButtonDidTapped(_ sender: Any) {
        
    }
    
}

extension TaskViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

extension TaskViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        testData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.identifier,
                                                 for: indexPath) as! TaskTableViewCell
        let task = testData[indexPath.row]
        cell.configure(task: task) { [weak self] in
            self?.testData[indexPath.row].isChecked.toggle()
            DispatchQueue.main.async {
                self?.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
        return cell
    }
    
    
}
