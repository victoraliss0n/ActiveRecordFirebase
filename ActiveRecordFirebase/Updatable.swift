//  Updatable.swift
//  Created by Victor Alisson on 24/11/16.
//  Copyright © 2016 Victor Alisson. All rights reserved.

import Foundation


protocol Updatable {
    
    func update(path: String, completion: @escaping (_ error: Error?) -> Void)
    func update(completion: @escaping (_ error: Error?) -> Void)
}
