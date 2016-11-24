
//  Readeable.swift
//  Created by Victor Alisson on 24/11/16.
//  Copyright © 2016 Victor Alisson. All rights reserved.


import Foundation


protocol Readaeble {
    
    typealias JSON = [String: AnyObject]
    static func asyncAll(completion: @escaping (_ json: JSON) -> Void)
    
}
