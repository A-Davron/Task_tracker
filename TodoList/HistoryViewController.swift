//
//  HistoryViewController.swift
//  TodoList
//
//  Created by Bilol Abdilxayev on 23/04/25.
//


import UIKit

class HistoryViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "History"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskDataManager.shared.completedTasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = TaskDataManager.shared.completedTasks[indexPath.row].name
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            TaskDataManager.shared.completedTasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
        }
    }
}
