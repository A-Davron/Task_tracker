import UIKit

class AddTodoViewController: UIViewController {

    var toDoTableViewController : TodoTableViewController?=nil
    
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var prioritySegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    

    @IBAction func addTodoTapped(_ sender: Any) {
        let newTask = Task()
        newTask.priority = prioritySegment.selectedSegmentIndex
        if let name = descriptionTextField.text {
            newTask.name = name
        }
        
        toDoTableViewController?.tasks.append(newTask)
        toDoTableViewController?.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
}
