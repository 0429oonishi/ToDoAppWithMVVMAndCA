//
//  TaskViewController.swift
//  ToDoAppWithMVVMAndCA
//
//  Created by 大西玲音 on 2021/06/19.
//

import UIKit
import RxSwift
import RxCocoa

final class TaskViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var addTaskButton: UIBarButtonItem!
    
    private let taskViewModel = TaskViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupBindings()
        
    }
    
    private func setupBindings() {
        addTaskButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.taskViewModel.outputs.goAdditionalTaskVC() {
                    let additionalTaskVC = AdditionalTaskViewController.instantiate()
                    additionalTaskVC.delegate = self
                    self?.navigationController?.pushViewController(additionalTaskVC, animated: true)
                }
            })
            .disposed(by: disposeBag)
        
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(TaskTableViewCell.nib,
                           forCellReuseIdentifier: TaskTableViewCell.identifier)
    }
    
}

extension TaskViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let editTaskVC = EditTaskViewController.instantiate(
            text: taskViewModel.task(at: indexPath.row).title
        )
        editTaskVC.editEvent = { [weak self] text in
            self?.taskViewModel.update(text, at: indexPath.row)
            DispatchQueue.main.async {
                self?.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
        editTaskVC.deleteEvent = { [weak self] in
            self?.taskViewModel.delete(at: indexPath.row)
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
        return taskViewModel.taskCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: TaskTableViewCell.identifier,
            for: indexPath
        ) as! TaskTableViewCell
        let task = taskViewModel.task(at: indexPath.row)
        cell.configure(task: task) { [weak self] in
            self?.taskViewModel.inputs.checkButtonDidTapped(index: indexPath.row) {
                DispatchQueue.main.async {
                    self?.tableView.reloadRows(at: [indexPath], with: .automatic)
                }
            }
        }
        return cell
    }
    
}

extension TaskViewController: AdditionalTaskViewControllerDelegate {
    
    func addButtonDidTapped(text: String) {
        taskViewModel.add(text: text)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}
