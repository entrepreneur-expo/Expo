//
//  product.swift
//  Expo
//
//  Created by Chris Farley on 6/26/19.
//  Copyright © 2019 ADNAP. All rights reserved.
//

import Foundation
import SwiftyJSON
class product{
    var name: String?
    var productLink: String?
    var productPrice: String?
    var productImageURL: String?
    var productDescription: String?
    
    
    
    
    
    
    
    
    func dictionaryToClass(dictionary:NSDictionary){
        let dict = JSON(dictionary)
        self.name = dict["name"].stringValue
        self.productImageURL = dict["image"].stringValue
        self.productDescription = dict["productDescription"].stringValue
        self.productPrice = dict["productPrice"].stringValue
        
        self.productImageURL = dict["productimageurl"].stringValue
        
        
    }
}
