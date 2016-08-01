//
//  appartmentTableViewCell.swift
//  rest-trip
//
//  Created by Sorochinskiy Dmitriy on 01.08.16.
//  Copyright © 2016 nelex. All rights reserved.
//

import UIKit

class appartmentTableViewCell: UITableViewCell {

    @IBOutlet weak var labelAdress: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var imageAppartment: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
