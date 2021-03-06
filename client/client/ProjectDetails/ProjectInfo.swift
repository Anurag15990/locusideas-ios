//
//  ProjectInfo.swift
//  client
//
//  Created by Neha Yadav on 02/02/16.
//  Copyright © 2016 LocusIdeas. All rights reserved.
//

import UIKit

class ProjectInfo: UITableViewCell {
    
    @IBOutlet weak var projectTitleLabel : UILabel!
    @IBOutlet weak var designerProfileImage : UIImageView!
    @IBOutlet weak var designerNameLabel : UILabel!
    @IBOutlet weak var followButton : UIButton!
    @IBOutlet weak var categoryLabel : UILabel!
    @IBOutlet weak var appreciationIconLabel: UILabel!
    @IBOutlet weak var appreciationCountLabel : UILabel!
    @IBOutlet weak var viewIconLabel : UILabel!
    @IBOutlet weak var viewCountLabel: UILabel!
    @IBOutlet weak var commentsIconLabel : UILabel!
    @IBOutlet weak var commentsCountLabel : UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        projectTitleLabel.text = "Single seater chair in phantom blue colour with an ottoman".uppercaseString
        designerNameLabel.text = "Dipankar Rajiblochan Chatterjee"

        designerProfileImage.layer.cornerRadius = CGFloat(5)
        designerProfileImage.image = UIImage(named: "Nick_Bateman.jpg")
        designerProfileImage.clipsToBounds = true
        
        followButton.layer.cornerRadius = CGFloat(5)
        followButton.layer.borderWidth = 2
        followButton.layer.borderColor = UIColor(red: 4/255, green: 158/255, blue: 143/255, alpha: 1.0).CGColor
        
        categoryLabel.text = "Furniture Design, Industrial Design, Interior Design"
        appreciationCountLabel.text = "12345678"
        viewCountLabel.text = "12345678"
        commentsCountLabel.text = "12345678"
        
        self.selectionStyle = .None

    }
    
    @IBAction func followButton(sender: UIButton) {
        
        if sender.currentTitleColor != UIColor.whiteColor() {
            sender.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            sender.backgroundColor = UIColor(red: 4.0/255.0, green: 158.0/255.0, blue: 143.0/255.0, alpha: 1.0)
            sender.setAttributedTitle(NSAttributedString(string: "", attributes: [NSFontAttributeName:UIFont(name: "MaterialDesignIcons", size: 22.0)!, NSForegroundColorAttributeName: UIColor.whiteColor()]), forState: UIControlState.Normal)
        } else {
            sender.setTitleColor(UIColor(red: 4.0/255.0, green: 158.0/255.0, blue: 143.0/255.0, alpha: 1.0), forState: .Normal)
            sender.backgroundColor = UIColor.whiteColor()
            sender.setAttributedTitle(NSAttributedString(string: "", attributes: [NSFontAttributeName: UIFont(name: "MaterialDesignIcons", size: 22.0)!, NSForegroundColorAttributeName: UIColor(red: 4.0/255.0, green: 158.0/255.0, blue: 143.0/255.0, alpha: 1.0)]), forState: UIControlState.Normal)
        }
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
