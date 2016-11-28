//
//  User.swift
//  ActiveRecordFirebase
//
//  Created by Victor Alisson on 24/11/16.
//  Copyright © 2016 Victor Alisson. All rights reserved.
//

import Foundation
import Firebase

class User: FIRDataModel, Uploadable, Typeable {
    
    
    @objc var email: String?
    @objc var password: String?
    
    func toAnyObject() -> [String : AnyObject] {
        return getJSON()
    }
    
    func getJSON() -> [String: AnyObject] {
        let keyPaths = [#keyPath(User.email), #keyPath(User.password)]
        return PathsManager.shared.configureJSON(keyPaths: keyPaths, type: self)
    }
    
}

