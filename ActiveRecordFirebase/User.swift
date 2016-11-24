//
//  User.swift
//  ActiveRecordFirebase
//
//  Created by Victor Alisson on 24/11/16.
//  Copyright © 2016 Victor Alisson. All rights reserved.
//

import Foundation
import Firebase

class User: FIRDataModel {
    
    private (set) var name: String
    private (set) var urlImage: String
    private (set) var keys: [String]
    
    var id: String {
        return (FIRAuth.auth()?.currentUser?.uid)!
    }
    
    required init(json: NSDictionary) {
        keys = Array(json.allKeys) as! [String]
        name = json[keys[0]] as! String
        urlImage = json[keys[1]] as! String

    }
    
    func toAnyObject() -> [String : AnyObject] {
        return [keys[0]: name as AnyObject, keys[1]: urlImage as AnyObject]
    }
    
    
}
