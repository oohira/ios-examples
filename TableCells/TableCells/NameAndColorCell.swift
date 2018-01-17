//
//  NameAndColorCell.swift
//  TableCells
//
//  Created by oohira on 2018/01/16.
//  Copyright © 2018年 oohira. All rights reserved.
//

import UIKit

class NameAndColorCell: UITableViewCell {

    var name = "" {
        didSet {
            if (name != oldValue) {
                nameLabel.text = name
            }
        }
    }
    var color = "" {
        didSet {
            if (color != oldValue) {
                colorLabel.text = color
            }
        }
    }
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var colorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
