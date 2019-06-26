//
//  presenter.swift
//  Expo
//
//  Created by Chris Farley on 6/25/19.
//  Copyright © 2019 ADNAP. All rights reserved.
//

import Foundation
import SwiftyJSON
class presenter{
    var name: String?
    var age: String?
    var bio: String?
    var profilePictureURL: String?
    var websiteURL: String?
    var industry: String?
    
    
    
    
    
    
    
    
    func dictionaryToClass(dictionary:NSDictionary){
        let dict = JSON(dictionary)
        self.name = dict["name"].stringValue
        self.websiteURL = dict["websiteurl"].stringValue
        self.industry = dict["industry"].stringValue
       
        self.profilePictureURL = dictionary["profileimageurl"] as? String
       
        
    }
}
