//
//  FeedTableViewCell.swift
//  snapChatProject
//
//  Created by Wilson Wang on 3/12/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var readSquare: UIImageView!
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var timeAgo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
