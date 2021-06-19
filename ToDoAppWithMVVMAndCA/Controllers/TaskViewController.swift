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
        let additionalTaskVC = AdditionalTaskViewController.instantiate()
        additionalTaskVC.delegate = self
        navigationController?.pushViewController(additionalTaskVC, animated: true)
    }
    
}

extension TaskViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let editTaskVC = EditTaskViewController.instantiate(text: testData[indexPath.row].title)
        editTaskVC.editEvent = { [weak self] text in
            self?.testData[indexPath.row].title = text
            DispatchQueue.main.async {
                self?.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
        editTaskVC.deleteEvent = { [weak self] in
            self?.testData.remove(at: indexPath.row)
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        navigationController?.pushViewController(editTaskVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}

extension TaskViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        testData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: TaskTableViewCell.identifier,
            for: indexPath
        ) as! TaskTableViewCell
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

extension TaskViewController: AdditionalTaskViewControllerDelegate {
    
    func addButtonDidTapped(text: String) {
        testData.append(Task(title: text, isChecked: false))
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}
