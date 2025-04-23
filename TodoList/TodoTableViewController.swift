//
//  TodoTableViewController.swift
//  TodoList
//
//  Created by Davron Abidov on 20/04/25.
//

import UIKit

class TodoTableViewController: UITableViewController {
    var tasks : [Task] = []

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let selectedTask = tasks[indexPath.row]
        
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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addTodoViewController = segue.destination as? AddTodoViewController {
            addTodoViewController.toDoTableViewController = self
        }
    }
}
