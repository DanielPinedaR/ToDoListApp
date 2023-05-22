//
//  ViewController.swift
//  ToDoListApp
//
//  Created by Marlon Gabriel Flores Ramos on 14/04/23.
//

import UIKit

enum TaskStatus: String {
    case finish = "Finalizado"
    case pending = "Pendiente"
}

class Task {
    var id: UUID
    var title: String
    var description: String
    var status: TaskStatus
    var date: Date?
    
    init(id: UUID = UUID(), title: String, description: String, status: TaskStatus, date: Date?) {
        self.id = id
        self.title = title
        self.description = description
        self.status = status
        self.date = date
    }
    
    var isLate: Bool {
        if let date {
            return Calendar.current.startOfDay(for: date)  < Calendar.current.startOfDay(for: Date.now)
        } else {
            return false
        }
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
    
    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
        taskTableView.reloadData()
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
        
        let nib_2 = UINib(nibName: "EmptyTableViewCell", bundle: nil)
        taskTableView.register(nib_2, forCellReuseIdentifier: "EmptyTableViewCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if TasksManager.shared.pendingTasks.count > 0 {
            return TasksManager.shared.pendingTasks.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if TasksManager.shared.pendingTasks.count > 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as! TaskTableViewCell
            cell.taskLabel.text = TasksManager.shared.pendingTasks[indexPath.row].title
            if TasksManager.shared.pendingTasks[indexPath.row].isLate {
                cell.statusLabel.text = "Atrasado"
                cell.statusLabel.textColor = UIColor(named: "secondaryColor")
             
            } else {
                cell.statusLabel.text = TasksManager.shared.pendingTasks[indexPath.row].status.rawValue
                cell.statusLabel.textColor = UIColor(named: "primaryColor")
               
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EmptyTableViewCell", for: indexPath) as! EmptyTableViewCell
            cell.isUserInteractionEnabled = false
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if TasksManager.shared.pendingTasks.count > 0 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
                vc.delegate = self
                vc.task = TasksManager.shared.pendingTasks[indexPath.row]
                self.navigationController?.present(vc, animated: true)
            }
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
    func saveTableView() {
        taskTableView.reloadData()
    }
}

extension UIView {
    func centerVertically() {
        if let superview = superview {
            translatesAutoresizingMaskIntoConstraints = false
            centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
        }
    }
}

