//
//  FishDetailTableViewCell.swift
//  kelp
//
//  Created by Jacqueline DesMarais on 11/12/17.
//  Copyright © 2017 Jacque DesMarais. All rights reserved.
//

import UIKit

class FishDetailTableViewCell: UITableViewCell {

    // MARK : Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var familyLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var aquariumLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!

    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
