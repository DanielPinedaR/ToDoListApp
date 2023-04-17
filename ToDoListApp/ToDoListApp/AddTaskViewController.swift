//
//  AddTaskViewController.swift
//  ToDoListApp
//
//  Created by Marlon Gabriel Flores Ramos on 14/04/23.
//

import UIKit

protocol AddTaskViewControllerDelegate: AnyObject {
    func addTask(task: String)
    func addStatus(status: String)
}

class AddTaskViewController: UIViewController {
    @IBOutlet weak var titleViewLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addTitleTextField: UITextField!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var addDescriptionTextField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var pendingTaskButton: UIButton!
    @IBOutlet weak var lateTaskButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    weak var delegate: AddTaskViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
        setupButton()
    }
    func setupTextField(){
        addTitleTextField.contentVerticalAlignment = .top
        addDescriptionTextField.contentVerticalAlignment = .top
    }
    func setupButton(){
        pendingTaskButton.layer.cornerRadius = 10
        pendingTaskButton.layer.borderWidth = 0.5
        pendingTaskButton.titleLabel?.font = .systemFont(ofSize: 20)
        lateTaskButton.layer.cornerRadius = 10
        lateTaskButton.layer.borderWidth = 0.5
        lateTaskButton.titleLabel?.font = .systemFont(ofSize: 20)
        addButton.titleLabel?.font = .systemFont(ofSize: 25)
    }

    @IBAction func pendingTaskButtonAction(_ sender: Any) {
        pendingTaskButton.backgroundColor = .systemOrange
        pendingTaskButton.setTitleColor(.white, for: .normal)
        lateTaskButton.backgroundColor = .white
        lateTaskButton.setTitleColor(.systemBlue, for: .normal)
        statusLabel.text = "Pendiente"
    }
    @IBAction func lateTaskButtonAction(_ sender: Any) {
        lateTaskButton.backgroundColor = .systemOrange
        lateTaskButton.setTitleColor(.white, for: .normal)
        pendingTaskButton.backgroundColor = .white
        pendingTaskButton.setTitleColor(.systemBlue, for: .normal)

    }
    
    @IBAction func addButtonAction(_ sender: Any) {
        if addTitleTextField.text == "" {
            let alerta = UIAlertController(title: "Error", message: "Se necesita agregar un título", preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alerta, animated: true, completion: nil)
        }
        else {
            delegate?.addTask(task: addTitleTextField.text ?? "")
            self.dismiss(animated: true)
            delegate?.addStatus(status: statusLabel.text ?? "")
        }
    }
}
