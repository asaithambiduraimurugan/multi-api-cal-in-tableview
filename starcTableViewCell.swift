//
//  starcTableViewCell.swift
//  multi api cal in tableview
//
//  Created by JAISHIVA SN on 29/02/24.
//

import UIKit

class starcTableViewCell: UITableViewCell {
    @IBOutlet weak var click: UILabel!
    
    @IBOutlet weak var check: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
