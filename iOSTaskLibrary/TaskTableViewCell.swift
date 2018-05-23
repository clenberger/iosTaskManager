//
//  taskTableViewCell.swift
//  iOSapptaskLibrary
//
//  Created by Christian Lenberger on 5/20/18.
//  Copyright © 2018 Christian Lenberger. All rights reserved.
//

import UIKit

class taskTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var avaliableLabel: UILabel!
    
    func setUpCell(task: apptask) {
        nameLabel.text = task.title
        genreLabel.text = task.genre
        if task.availability {
            avaliableLabel.text = "Not Completed"
            avaliableLabel.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
        } else {
            avaliableLabel.text = "Completed"
            avaliableLabel.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        }
    }
}
