//
//  FestivalsTableViewCell.swift
//  RoyalRajasthan
//
//  Created by Hardik on 12/2/17.
//  Copyright © 2017 Hardik. All rights reserved.
//

import UIKit

class FestivalsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgFestival: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
