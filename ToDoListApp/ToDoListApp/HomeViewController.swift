//
//  ViewController.swift
//  ToDoListApp
//
//  Created by Marlon Gabriel Flores Ramos on 14/04/23.
//

import UIKit

enum TaskStatus: String {
    case finish = "finalizado"
    case pending = "pendiente"
    case late = "atrasado"
}

class Task {
    var title: String
    var description: String
    var status: TaskStatus
    
    init(title: String, description: String, status: TaskStatus) {
        self.title = title
        self.description = description
        self.status = status
    }
}

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var finishTaskButton: UIButton!
    @IBOutlet weak var taskTableView: UITableView!
    @IBOutlet weak var addTaskButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    func setupUI(){
        setupTableView()
        setupButton()
    }
    func setupButton(){
        addTaskButton.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
    }
    func setupTableView(){
        let nib = UINib(nibName: "TaskTableViewCell", bundle: nil)
        taskTableView.register(nib, forCellReuseIdentifier: "TaskTableViewCell")
        taskTableView.delegate = self
        taskTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TasksManager.shared.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as! TaskTableViewCell
        cell.taskLabel.text = TasksManager.shared.tasks[indexPath.row].title
        cell.statusLabel.text = TasksManager.shared.tasks[indexPath.row].status.rawValue
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            vc.delegate = self
            vc.task = TasksManager.shared.tasks[indexPath.row]
            self.navigationController?.present(vc, animated: true)
            
        }
        
    }

    @IBAction func addTaskButtonAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "AddTaskViewController") as? AddTaskViewController {
            vc.delegate = self
            self.navigationController?.present(vc, animated: true)
        }
    }
    
    @IBAction func finishTaskButtonAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "FinishedViewController") as? FinishedViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension HomeViewController: AddTaskViewControllerDelegate {
    func finishFlow() {
        taskTableView.reloadData()
    }
}

extension HomeViewController: DetailViewControllerDelegate {
    func addFinishStatus(status: String) {
    }
    
    func removeFinishStatus() {
    }
}

