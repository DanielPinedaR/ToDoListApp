//
//  TaskTableViewCell.swift
//  ToDoListApp
//
//  Created by Marlon Gabriel Flores Ramos on 14/04/23.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUI()
    }
    
    func setupUI(){
        setupTaskLabel()
        setupStatusLabel()
    }
    func setupTaskLabel(){
        taskLabel.font = .systemFont(ofSize: 23)
    }
    func setupStatusLabel(){
        statusLabel.font = .systemFont(ofSize: 23)
        statusLabel.textColor = .orange
    }
    
    
}
