//
//  StreamDesignCard.swift
//  client
//
//  Created by Neha Yadav on 20/01/16.
//  Copyright © 2016 LocusIdeas. All rights reserved.
//

import UIKit
//import SDWebImage

class StreamDesignCard: UITableViewCell {
    
    @IBOutlet weak var containerView : ShadowedContainerView!
    @IBOutlet weak var designCoverImage : UIImageView!
    @IBOutlet weak var designTitleLabel : UILabel!
    @IBOutlet weak var designerNameLabel : UILabel!
    @IBOutlet weak var categoryLabel : UILabel!
    @IBOutlet weak var viewCountLabel : UILabel!
    @IBOutlet weak var appreciationCountLabel : UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        designerNameLabel.text = "Dipankar Rajiblochan Chatterjee"
        categoryLabel.text = "Modern"
        appreciationCountLabel.text = "12345"
        viewCountLabel.text = "123456"
        
        self.selectionStyle = .None
    }
    
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
