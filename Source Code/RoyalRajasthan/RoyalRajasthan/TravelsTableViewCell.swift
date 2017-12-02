//
//  TravelsTableViewCell.swift
//  RoyalRajasthan
//
//  Created by Hardik on 12/2/17.
//  Copyright © 2017 Hardik. All rights reserved.
//

import UIKit

class TravelsTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTravelName: UILabel!

    @IBOutlet weak var btnEmail: UIButton!
    @IBOutlet weak var btnPhone: UIButton!
    @IBOutlet weak var imvIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
