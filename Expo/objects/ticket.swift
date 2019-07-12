//
//  ticket.swift
//  Expo
//
//  Created by Chris Farley on 6/26/19.
//  Copyright © 2019 ADNAP. All rights reserved.
//

import Foundation
import SwiftyJSON
class ticket{
    var name: String?
    var description: String?
    
    var cost: [String:Any]?
    var image: String?
    
    
    
    
    func dictionaryToClass(dictionary:NSDictionary){
        let dict = JSON(dictionary)
        self.name = dict["name"].stringValue
        self.cost = dict["cost"].dictionaryObject
        self.description = dict["description"].stringValue
        
        
        
        
    }
}
