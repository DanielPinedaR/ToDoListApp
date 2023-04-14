//
//  ViewController.swift
//  ToDoListApp
//
//  Created by Marlon Gabriel Flores Ramos on 14/04/23.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var taskTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
    }
    
    func setupTableView(){
        taskTableView.register(TaskTableViewCell.self, forCellReuseIdentifier: "taskCell")
        taskTableView.delegate = self
        taskTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskcell", for: indexPath) as! TaskTableViewCell
        return cell
    }

}

