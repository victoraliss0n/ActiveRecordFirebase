//
//  MusicTableViewCell.swift
//  ActiveRecordFirebase
//
//  Created by Victor Alisson on 27/11/16.
//  Copyright © 2016 Victor Alisson. All rights reserved.
//

import UIKit

class MusicTableViewCell: UITableViewCell {
    @IBOutlet var musicImageView: UIImageView!

    @IBOutlet var autorLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
