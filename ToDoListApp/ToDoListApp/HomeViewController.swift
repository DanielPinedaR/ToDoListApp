//
//  ViewController.swift
//  ToDoListApp
//
//  Created by Marlon Gabriel Flores Ramos on 14/04/23.
//

import UIKit

enum TaskStatus: String {
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
    @IBOutlet weak var taskTableView: UITableView!
    @IBOutlet weak var addTaskButton: UIButton!
    
    var indice: Int = 0
    var tasks = [Task]()
    
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
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as! TaskTableViewCell
        cell.taskLabel.text = tasks[indexPath.row].title
        cell.statusLabel.text = tasks[indexPath.row].status.rawValue
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indice = indexPath.row
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            vc.delegate = self
            vc.task = tasks[indexPath.row]
            self.navigationController?.present(vc, animated: true)
//            vc.task = Task(title: tasks[indexPath.row].title, description: tasks[indexPath.row].description, status: tasks[indexPath.row].status)
            
        }
        
    }

    @IBAction func addTaskButtonAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "AddTaskViewController") as? AddTaskViewController {
            vc.delegate = self
            self.navigationController?.present(vc, animated: true)
        }
    }
}

extension HomeViewController: AddTaskViewControllerDelegate {
    func addTask(task: Task) {
        tasks.append(task)
        taskTableView.reloadData()
    }
}

extension HomeViewController: DetailViewControllerDelegate {
    func addFinishStatus(status: String) {
    }
    
    func removeFinishStatus() {
    }
}

