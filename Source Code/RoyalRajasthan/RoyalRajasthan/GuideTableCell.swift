//
//  HotelsTableCell.swift
//  RoyalRajasthan
//
//  Created by Chintan patel on 02/12/17.
//  Copyright © 2017 Hardik. All rights reserved.
//

import UIKit

class GuideTableCell: UITableViewCell {
    @IBOutlet weak var imgHotel: UIImageView!
    @IBOutlet weak var lblHotelName: UILabel!
    @IBOutlet weak var btnCallTapped: UIButton!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblRattings: UILabel!
    @IBOutlet weak var lblLanguage: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
