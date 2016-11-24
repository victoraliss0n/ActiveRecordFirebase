

//  Deletable.swift
//  Created by Victor Alisson on 24/11/16.
//  Copyright © 2016 Victor Alisson. All rights reserved.

import Foundation


protocol Deletable {
    
    func destroy(path: String, completion: @escaping (_ error: Error?) -> Void)
    
}
