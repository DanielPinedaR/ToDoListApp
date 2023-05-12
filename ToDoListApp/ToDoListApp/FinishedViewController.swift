//
//  FinishedViewController.swift
//  ToDoListApp
//
//  Created by Marlon Gabriel Flores Ramos on 29/04/23.
//

import UIKit

class FinishedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var taskFinishedTable: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI(){
        setupTableView()
    }
    
    func setupTableView(){
        let nib = UINib(nibName: "TaskTableViewCell", bundle: nil)
        taskFinishedTable.register(nib, forCellReuseIdentifier: "TaskTableViewCell")
        taskFinishedTable.delegate = self
        taskFinishedTable.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        TasksManager.shared.completedTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as! TaskTableViewCell
            cell.taskLabel.text = TasksManager.shared.completedTasks[indexPath.row].title
            cell.statusLabel.text = TasksManager.shared.completedTasks[indexPath.row].status.rawValue
            return cell
    }
    
}
