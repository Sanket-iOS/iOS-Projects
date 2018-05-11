//
//  TableViewCell.swift
//  device controller
//
//  Created by Mac on 08/05/18.
//  Copyright © 2018 TOPS. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lbl_room: UILabel!
    
    @IBOutlet weak var lbl_pointnm: UILabel!
    @IBOutlet weak var lbl_lfid: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
