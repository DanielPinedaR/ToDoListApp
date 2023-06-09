//
//  DetailViewController.swift
//  ToDoListApp
//
//  Created by Marlon Gabriel Flores Ramos on 18/04/23.
//

import UIKit

protocol DetailViewControllerDelegate: AnyObject {
    func saveTableView()
}
class DetailViewController: UIViewController {
    
    var task: Task? = nil
    
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var detailTitleTask: UILabel!
    @IBOutlet weak var detailDescriptionTask: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var detailDateTask: UILabel!
    @IBOutlet weak var finishControl: UISegmentedControl!
    
    weak var delegate: DetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitleTask()
        setupDetailDateTask()
        finishControl.selectedSegmentIndex = task?.status == .finish ? 1 : 0
    }
    
    func setupTitleTask(){
        if task?.isLate ?? false {
            detailTitleLabel.text = "Atrasado"
        }
        else {
            detailTitleLabel.text = task?.status.rawValue
        }
        detailTitleLabel.textColor = UIColor(named: "quaternaryColor")
        detailTitleTask.text = task?.title
        detailDescriptionTask.text = task?.description
        detailDescriptionTask.isHidden = detailDescriptionTask.text == ""
    }
    
    func setupDetailDateTask(){
        
        let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd/MM/yyyy"
        if task?.date == nil {
            detailDateTask.text = ""
        }
        else {
            detailDateTask.text = dateFormatter.string(from: task?.date ?? Date.now)
        }
    }
    
    @IBAction func finishControlAction(_ sender: UISegmentedControl) {
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        guard let task else { return }
        task.status = (finishControl.selectedSegmentIndex == 1) ? .finish : .pending
        TasksManager.shared.updateTask(id: task.id, task: task)
        delegate?.saveTableView()
        self.dismiss(animated: true)
    }
}
