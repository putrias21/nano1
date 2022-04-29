//
//  ActivityTableViewCell.swift
//  nano1
//
//  Created by putri as on 29/04/22.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {
    
    @IBOutlet var activityLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
