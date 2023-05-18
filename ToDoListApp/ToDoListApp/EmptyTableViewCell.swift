//
//  EmptyTableViewCell.swift
//  ToDoListApp
//
//  Created by Marlon Gabriel Flores Ramos on 18/05/23.
//

import UIKit

class EmptyTableViewCell: UITableViewCell {

    @IBOutlet weak var emptyImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
