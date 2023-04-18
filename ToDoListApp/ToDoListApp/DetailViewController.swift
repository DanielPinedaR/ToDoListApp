//
//  DetailViewController.swift
//  ToDoListApp
//
//  Created by Marlon Gabriel Flores Ramos on 18/04/23.
//

import UIKit
protocol DetailViewControllerDelegate: AnyObject {
}
class DetailViewController: UIViewController {

    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var detailTitleTask: UILabel!
    @IBOutlet weak var detailDescriptionTask: UILabel!
    @IBOutlet weak var finishControl: UISegmentedControl!
    
    weak var delegate: DetailViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func finishControlAction(_ sender: Any) {
    }
    
}
