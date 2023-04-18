//
//  ViewController.swift
//  ToDoListApp
//
//  Created by Marlon Gabriel Flores Ramos on 14/04/23.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddTaskViewControllerDelegate, DetailViewControllerDelegate {
    func addDescriptionTask(description: String) {
        arrayDescriptionTask.append(description)
        taskTableView.reloadData()
    }
    
    func addStatus(status: String) {
        statusLabel.append(status)
        taskTableView.reloadData()
    }
    
    func addTitleTask(task: String) {
        arrayTitleTask.append(task)
        taskTableView.reloadData()
    }
    
    var statusLabel: [String] = []
    var arrayTitleTask: [String] = []
    var arrayDescriptionTask: [String] = []
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            vc.delegate = self
            self.navigationController?.present(vc, animated: true)
            vc.detailTitleLabel.text = statusLabel[indexPath.row]
            vc.detailTitleTask.text = arrayTitleTask[indexPath.row]
            vc.detailDescriptionTask.text = arrayDescriptionTask[indexPath.row]
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayTitleTask.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as! TaskTableViewCell
        cell.taskLabel.text = arrayTitleTask[indexPath.row]
        cell.statusLabel.text = statusLabel[indexPath.row]
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

