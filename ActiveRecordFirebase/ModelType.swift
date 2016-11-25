//  ModelType.swift
//  Created by Victor Alisson on 24/11/16.
//  Copyright © 2016 Victor Alisson. All rights reserved.

import Foundation


protocol ModelType: ActiveRecord {
    
    associatedtype Reference
    static var reference: Self.Reference { get }
    
}
