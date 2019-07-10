//
//  PresenterTableViewCell.swift
//  Expo
//
//  Created by Chris Farley on 7/9/19.
//  Copyright © 2019 ADNAP. All rights reserved.
//

import UIKit

class PresenterTableViewCell: UITableViewCell {

    @IBOutlet weak var presenterNameLabel: UILabel!
    @IBOutlet weak var presenterImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
