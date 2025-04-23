//
//  TodoTableViewController.swift
//  TodoList
//
//  Created by Davron Abidov on 20/04/25.
//

import UIKit

class TodoTableViewController: UITableViewController {

    // MARK: - Table view data source
    
    override func viewDidLoad() {
            super.viewDidLoad()
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return TaskDataManager.shared.activeTasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let selectedTask = TaskDataManager.shared.activeTasks[indexPath.row]
        
        if selectedTask.priority == 1 {
            cell.textLabel?.text = "❗️" + selectedTask.name
        }
        else if selectedTask.priority == 2 {
            cell.textLabel?.text = "‼️" + selectedTask.name
        }
        else {
            cell.textLabel?.text = selectedTask.name
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let doneAction = UIContextualAction(style: .normal, title: "Done") { [weak self] action, view, completionHandler in
            guard let _ = self else { return }

            let completedTask = TaskDataManager.shared.activeTasks.remove(at: indexPath.row)
            TaskDataManager.shared.completedTasks.append(completedTask)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        doneAction.backgroundColor = .systemBlue
            
        return UISwipeActionsConfiguration(actions: [doneAction])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAddTodo" {
            if let _ = segue.destination as? AddTodoViewController {
            }
        }
        else if segue.identifier == "showHistory" {
            if let _ = segue.destination as? HistoryViewController {
            }
        }
    }
}
