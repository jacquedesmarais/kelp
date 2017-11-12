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
        setRoundedView(roundedView: photoImageView)
    }
    
    func setRoundedView (roundedView:UIView) {
        let saveCenter = roundedView.center
        let newFrame:CGRect = CGRect(origin: CGPoint(x: roundedView.frame.origin.x,y :roundedView.frame.origin.y), size: CGSize(width: roundedView.frame.size.width, height: roundedView.frame.size.height))
        roundedView.layer.cornerRadius = roundedView.frame.height/2
        roundedView.frame = newFrame;
        roundedView.center = saveCenter
        roundedView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
