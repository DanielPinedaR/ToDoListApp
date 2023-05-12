//
//  DetailViewController.swift
//  ToDoListApp
//
//  Created by Marlon Gabriel Flores Ramos on 18/04/23.
//

import UIKit
protocol DetailViewControllerDelegate: AnyObject {
    func addFinishStatus(status: String)
    func removeFinishStatus()
}
class DetailViewController: UIViewController {
    
    var task: Task? = nil
    
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var detailTitleTask: UILabel!
    @IBOutlet weak var detailDescriptionTask: UILabel!
    @IBOutlet weak var finishControl: UISegmentedControl!
    
    weak var delegate: DetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitleTask()
        finishControl.selectedSegmentIndex = task?.status == .finish ? 1 : 0
    }
    
    func setupTitleTask(){
        detailTitleLabel.text = task?.status.rawValue
        detailTitleTask.text = task?.title
        detailDescriptionTask.text = task?.description
    }
    
    @IBAction func finishControlAction(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            guard let task else { return }
            task.status = .finish
            TasksManager.shared.updateTask(id: task.id, task: task)
        }
        else {
            guard let task else { return }
            task.status = .pending
            TasksManager.shared.updateTask(id: task.id, task: task)
        }
    }
}
