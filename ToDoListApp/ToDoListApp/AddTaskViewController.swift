//
//  AddTaskViewController.swift
//  ToDoListApp
//
//  Created by Marlon Gabriel Flores Ramos on 14/04/23.
//

import UIKit

protocol AddTaskViewControllerDelegate: AnyObject {
    func finishFlow()
}

class AddTaskViewController: UIViewController {
    let datePicker = UIDatePicker()
    var statusValue: String = ""
    @IBOutlet weak var titleViewLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addTitleTextField: UITextField!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var addDescriptionTextField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    weak var delegate: AddTaskViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        setupTextField()
        setupDateField()
        setupButton()
    }
    
    func setupTextField(){
        addTitleTextField.contentVerticalAlignment = .top
        addDescriptionTextField.contentVerticalAlignment = .top
    }
    
    func setupButton(){
        addButton.titleLabel?.font = .systemFont(ofSize: 25)
    }
    
    func setupDateField(){
        createDatePicker()
    }
    
    func createToolBar() -> UIToolbar{
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolBar.setItems([doneBtn], animated: true)
        
        return toolBar
    }
    
    func createDatePicker(){
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        dateTextField.inputView = datePicker
        dateTextField.inputAccessoryView = createToolBar()
    }
    
    @objc func donePressed(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        self.dateTextField.text = dateFormatter.string(from: datePicker.date)
        dateTextField.textAlignment = .center
        self.view.endEditing(true)
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
        if addTitleTextField.text == "" {
            let alerta = UIAlertController(title: "Error", message: "Se necesita agregar un título", preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alerta, animated: true, completion: nil)
        }
        else {
            TasksManager.shared.addTask(task: Task(
                                    title: addTitleTextField.text ?? "",
                                    description: addDescriptionTextField.text ?? "",
                                    status: .pending,
                                    date: datePicker.date
                                ))
            delegate?.finishFlow()
            self.dismiss(animated: true)
        }
    }
}
