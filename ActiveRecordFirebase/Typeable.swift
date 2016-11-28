//
//  Typeable.swift
//  ActiveRecordFirebase
//
//  Created by Victor Alisson on 27/11/16.
//  Copyright © 2016 Victor Alisson. All rights reserved.
//

import Foundation

protocol Typeable {
    typealias JSON = [String: AnyObject]
    func getJSON() -> JSON
}
