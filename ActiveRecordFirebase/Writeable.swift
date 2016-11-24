
//  Writeable.swift
//  Created by Victor Alisson on 24/11/16.
//  Copyright © 2016 Victor Alisson. All rights reserved.

import Foundation


protocol Writeable {
    
    typealias JSON = [String: AnyObject]
    func save(completion: @escaping (_ error: Error?) -> Void)
}
