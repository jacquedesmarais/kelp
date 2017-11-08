//
//  MealTableViewCell.swift
//  coffee tracker
//
//  Created by Jacque on 10/10/16.
//  Copyright © 2016 jacquedes. All rights reserved.
//

import UIKit

class KelpTableViewCell: UITableViewCell {
    
    // MARK : Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var familyLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
