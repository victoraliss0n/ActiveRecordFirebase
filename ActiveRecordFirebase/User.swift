//
//  User.swift
//  ActiveRecordFirebase
//
//  Created by Victor Alisson on 24/11/16.
//  Copyright © 2016 Victor Alisson. All rights reserved.
//

import Foundation
import Firebase

class User: FIRDataModel, Uploadable {
    
    //Values
    @objc private (set) var name: String
    @objc private (set) var urlImage: String

    //Keys
    private (set) static var nameKey = #keyPath(User.name)
    private (set) static var urlImageKey = #keyPath(User.urlImage)
    
    
    required init(json: NSDictionary) {
        name = json[User.nameKey] as! String
        urlImage = json[User.urlImageKey] as! String
    }
    
    
    func toAnyObject() -> [String : AnyObject] {
        return [User.nameKey: name as AnyObject, User.urlImageKey: urlImage as AnyObject]
    }
    
    
}
