//
//  UserMusic.swift
//  ActiveRecordFirebase
//
//  Created by Victor Alisson on 27/11/16.
//  Copyright © 2016 Victor Alisson. All rights reserved.
//

import Foundation


class UserMusic: FIRDataModel, Typeable {
    
    @objc var idUser: String?
    @objc var idMusic: String?
    
    typealias JSON = [String: AnyObject]
    
    func toAnyObject() -> [String : AnyObject] {
        return getJSON()
    }
    
    func getJSON() -> Typeable.JSON {
        return self.configureRelantionshipJSON()
    }
    
    func configureRelantionshipJSON() -> JSON {
        
        let mirror = Mirror(reflecting: self)
        var json: [String : AnyObject] = [:]
        for child in mirror.children {
            let id = child.value as! String
            if "idMusic" == child.label! {
                json[id] = true as AnyObject?
            }
        }
        return json
    }
}
