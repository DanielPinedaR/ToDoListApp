//
//  ViewController.swift
//  ToDoListApp
//
//  Created by Marlon Gabriel Flores Ramos on 14/04/23.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddTaskViewControllerDelegate {
    func addTask(task: String) {
        arrayTask.append(task)
        taskTableView.reloadData()
    }
    
    
    var arrayTask: [String] = []
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var taskTableView: UITableView!
    @IBOutlet weak var addTaskButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
    }
    
    func setupTableView(){
        let nib = UINib(nibName: "TaskTableViewCell", bundle: nil)
        taskTableView.register(nib, forCellReuseIdentifier: "TaskTableViewCell")
        taskTableView.delegate = self
        taskTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayTask.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as! TaskTableViewCell
        cell.taskLabel.text = arrayTask[indexPath.row]
        return cell
    }

    @IBAction func addTaskButtonAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "AddTaskViewController") as? AddTaskViewController {
            vc.delegate = self
            self.navigationController?.present(vc, animated: true)
        }
    }
}

