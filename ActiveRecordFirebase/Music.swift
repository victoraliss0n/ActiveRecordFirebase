//
//  Music.swift
//  ActiveRecordFirebase
//
//  Created by Victor Alisson on 27/11/16.
//  Copyright © 2016 Victor Alisson. All rights reserved.
//

import Foundation


class Music: FIRDataModel, Uploadable, Typeable {
    
    @objc var type: String?
    @objc var autor: String?
    @objc var urlImage: String?
    
    typealias JSON = [String: AnyObject]
    
    func toAnyObject() -> JSON {
        return getJSON()
    }
    
    func getJSON() -> [String: AnyObject] {
        let keyPaths = [#keyPath(Music.type), #keyPath(Music.autor), #keyPath(Music.urlImage)]
        return PathsManager.shared.configureJSON(keyPaths: keyPaths, type: self)
    }
        
}
