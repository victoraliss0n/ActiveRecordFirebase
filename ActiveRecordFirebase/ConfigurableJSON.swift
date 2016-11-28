//
//  Configurable.swift

//  Created by Victor Alisson on 28/11/16.
//  Copyright © 2016 Victor Alisson. All rights reserved.
//

import Foundation

protocol ConfigurableJSON {
    typealias JSON = [String: AnyObject]
    func configureJSON(keyPaths: [String], type: Typeable) -> JSON
    func configureRelantionshipJSON(type: Typeable) -> JSON
    
}
extension ConfigurableJSON {
    
    func configureJSON(keyPaths: [String], type: Typeable) -> JSON {
        
        let mirror = Mirror(reflecting: type)
        let properties = mirror.children.filter( { child in
            return keyPaths.contains(child.label!)
        })
        var json: [String : AnyObject] = [:]
        for child in properties {
            json[child.label!] = child.value as AnyObject?
        }
        return json
    }
    
    func configureRelantionshipJSON(type: Typeable) -> JSON {
        let mirror = Mirror(reflecting: type)
        var json: [String : AnyObject] = [:]
        for child in mirror.children {
            let id = child.value as AnyObject
            json[id as! String] = true as AnyObject?
        }
        return json
    }
}

