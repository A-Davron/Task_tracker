import UIKit

class AddTodoViewController: UIViewController {
    
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var prioritySegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextField.delegate = self
    }
    
    @IBAction func addTodoTapped(_ sender: Any) {
        guard let name = descriptionTextField.text, !name.isEmpty else { return }
        
        let newTask = Task()
        newTask.name = name
        newTask.priority = prioritySegment.selectedSegmentIndex
        
        TaskDataManager.shared.activeTasks.append(newTask)
        TaskDataManager.shared.sortTasks()
        navigationController?.popViewController(animated: true)
    }
}

extension AddTodoViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addTodoTapped(textField)
        return true
    }
}
