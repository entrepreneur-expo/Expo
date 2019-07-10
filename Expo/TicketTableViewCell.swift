//
//  TicketTableViewCell.swift
//  Expo
//
//  Created by Chris Farley on 7/8/19.
//  Copyright © 2019 ADNAP. All rights reserved.
//

import UIKit

class TicketTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ticketName: UILabel!
    @IBOutlet weak var ticketImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
