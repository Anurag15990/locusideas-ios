//
//  DesignerProfileViewModel.swift
//  client
//
//  Created by Anurag Agnihotri on 6/30/16.
//  Copyright © 2016 LocusIdeas. All rights reserved.
//

import Foundation
import UIKit
import Bond

class DesignerProfileViewModel: NSObject {
    
    var user: User!
    var projects =  ObservableArray<Project>()
    var paging: Pagination!
    
    init(user: User) {
        super.init()
        self.user = user
        self.fetchProjectsForOwner()
    }
    
    /**
     Method to fetch projects for User.
     */
    func fetchProjectsForOwner() {
        ProjectService.sharedInstance.fetchProjectsByOwner(self.user.id!, successCallback: { (projects, paging) in
            self.projects.removeAll()
            self.projects.appendContentsOf(projects)
            self.paging = paging
            }) { (error) in
                //TODO: Handle Error.
        }
    }
    
    /**
     Method to fetch Project Initial Image.
     
     - parameter project: <#project description#>
     
     - returns: <#return value description#>
     */
    func fetchProjectInitialImage(project: Project) -> String? {
        return project.medias?.initial?.first?.media?.url
    }
    
    /**
     Method to fetch Project Name.
     
     - parameter project: <#project description#>
     
     - returns: <#return value description#>
     */
    func fetchProjectName(project: Project) -> String? {
        return project.title
    }
    
    /**
     Method to return User Profile Picture Url
     
     - parameter user: <#user description#>
     
     - returns: <#return value description#>
     */
    func fetchUserProfilePictureUrl() -> String? {
        return user.picture?.url
    }
    
    /**
     Method to return User Cover Image Url
     
     - parameter user: <#user description#>
     
     - returns: <#return value description#>
     */
    func fetchUserCoverImageUrl() -> String? {
        return user.cover?.url
    }
    
    /**
     Method to fetch User Name
     
     - returns: <#return value description#>
     */
    func fetchUserName() -> String {
        var fullName = ""
        
        if let firstName = user.name?.firstName {
            fullName += firstName + " "
        }
        
        if let lastName = user.name?.lastName {
            fullName += lastName + " "
        }
        
        return fullName
    }
    
    /**
     Method to fetch User Location.
     
     - returns: <#return value description#>
     */
    func fetchUserLocation() -> String? {
        return user.location?.currentCity
    }
    
    /**
     Method to fetch Location Text for label.
     
     - parameter location: <#location description#>
     
     - returns: <#return value description#>
     */
    func fetchLocationText() -> NSAttributedString? {
        
        let locationIcon = ""
        
        let locationParagraphStyle = NSMutableParagraphStyle()
        
        locationParagraphStyle.lineHeightMultiple = 1.0
        
        if let location = self.fetchUserLocation() {
            
            let locationLabelText = locationIcon + location
            
            let myMutableString = NSMutableAttributedString(string: locationLabelText, attributes: [NSFontAttributeName: UIFont(name: "Asap-Regular", size: 16.0)!])
            
            myMutableString.addAttribute(NSFontAttributeName, value: UIFont(name: "MaterialDesignIcons", size: 16.0)!, range: NSRange(location: 0, length: 1))
            
            myMutableString.addAttribute(NSParagraphStyleAttributeName, value: locationParagraphStyle, range: NSRange(location: 0, length: myMutableString.length))
            
            return myMutableString
        }
        
        return nil
    }
    
    /**
     Method to fetch User Bio.
     
     - returns: <#return value description#>
     */
    func fetchUserBio() -> String? {
        return self.user.bio?.short
    }
    
    /**
     Method to fetch User Work Experience.
     
     - returns: <#return value description#>
     */
    func fetchUserWorkExperience() -> User.Work? {
        return self.user.work
    }
    
    /**
     Method to fetch User Education Experience.
     
     - returns: <#return value description#>
     */
    func fetchUserEducationExperience() -> User.Education? {
        return self.user.education
    }
    
    /**
     Method for fetching User's Primary Website
     
     - returns: <#return value description#>
     */
    func fetchUserWebsite() -> String? {
        return self.user.links?.website?.primary
    }
    
    /**
     Method fo fetching User's Links.
     
     - parameter index: <#index description#>
     
     - returns: <#return value description#>
     */
    func fetchUserSocialLink(index: Int) -> (String, String)? {
        if let social = self.user.links?.social {
            let socialObject = social[index]
            
            switch  socialObject.type! {
                
            case "facebook":
                return ("", socialObject.url!)
                
            case "twitter":
                return ("", socialObject.url!)
                
            case "instagram":
                return ("", socialObject.url!)
                
            case "linkedIn":
                return ("", socialObject.url!)
                
            default:
                return nil
            }
        }
        
        return nil
    }
    
    /**
     Method to fetch User Email.
     
     - returns: <#return value description#>
     */
    func fetchUserEmail() -> String? {
        return self.user.emailPrimary?.address
    }
    
    /**
     Method to fetch User Primary Contact Number.
     
     - returns: <#return value description#>
     */
    func fetchUserPrimaryContact() -> String? {
        return self.user.phonePrimary?.subscriberNumber
    }
    
    /**
     Method to Construct Follow Button Text.
     
     - returns: <#return value description#>
     */
    func constructFollowButtonText() -> NSAttributedString? {
        
        let followIcon = ""
        
        let followText = followIcon + " Follow"
        
        let attributedString = NSMutableAttributedString(string: followText, attributes: [NSFontAttributeName: UIFont(name: "Asap-Medium", size: 16.0)!])
        
        attributedString.addAttribute(NSFontAttributeName, value: UIFont(name: "MaterialDesignIcons", size: 16.0)!, range: NSRange(location: 0, length: 1))
        
        return attributedString
    }
    
    /**
     Fetch Location Label Height Constant.
     
     - returns: <#return value description#>
     */
    func fetchLocationLabelHeight() -> CGFloat {
        
        if let _ = self.fetchLocationText() {
            return 21
        }

        return 0
    }
    
    /**
     Fetch Location Label Padding.
     
     - returns: <#return value description#>
     */
    func fetchLocationLabelPadding() -> CGFloat {
        if let _ = self.fetchLocationText() {
            return 8
        }
        
        return 0
    }
    
    func fetchHeightForBioLabel() -> CGFloat {
        let font = UIFont(name: "Asap-regular", size: 13)!
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.9
        paragraphStyle.lineSpacing = 4.0
        
        if let shortBio = self.user.bio?.short {
            let rect = NSString(string: shortBio).boundingRectWithSize(CGSize(width: UIScreen.mainScreen().bounds.width, height: CGFloat(MAXFLOAT)), options: .UsesLineFragmentOrigin, attributes: [NSFontAttributeName : font, NSParagraphStyleAttributeName: paragraphStyle], context: nil)
            
            let descriptionHeight = ceil(rect.height)
            let height = descriptionHeight
            
            if height < 50 {
                return 50
            }
            return height
        }
        
        return 50
    }
    
}