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
    
    
    @objc var email: String?
    @objc var password: String?
    
    
    func toAnyObject() -> [String : AnyObject] {
        return getJSON()
    }
    
   fileprivate func getJSON() -> [String: AnyObject] {
    
        let keyPaths = [#keyPath(User.email), #keyPath(User.password)]
        let mirror = Mirror(reflecting: self)
        
        let properties = mirror.children.filter( { child in
            return keyPaths.contains(child.label!)
        })
    
        var json: [String : AnyObject] = [:]
        
        for child in properties {
            json[child.label!] = child.value as AnyObject?
        }
    
        return json
    }
    
}

