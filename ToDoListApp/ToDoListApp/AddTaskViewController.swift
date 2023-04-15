//
//  AddTaskViewController.swift
//  ToDoListApp
//
//  Created by Marlon Gabriel Flores Ramos on 14/04/23.
//

import UIKit

protocol AddTaskViewControllerDelegate: AnyObject {
    func addTask(task: String)
}

class AddTaskViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var addTextField: UITextField!
    
    @IBOutlet weak var addButton: UIButton!
    
    weak var delegate: AddTaskViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
    }
    func setupTextField(){
        addTextField.contentVerticalAlignment = .top
    }

    
    @IBAction func addButtonAction(_ sender: Any) {
        delegate?.addTask(task: addTextField.text ?? "")
        self.dismiss(animated: true)
    }
}
