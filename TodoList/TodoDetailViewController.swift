//
//  TodoDetailViewController.swift
//  TodoList
//
//  Created by Davron Abidov on 20/04/25.
//

import UIKit

class TodoDetailViewController: UIViewController {

    var task = Task()
    
    @IBOutlet weak var taskLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if task.priority == 1 {
            taskLabel.text = "❗️" + task.name
        }
        else if task.priority == 2 {
            taskLabel.text = "‼️" + task.name
        }
        else {
            taskLabel.text = task.name
        }
    }
}
