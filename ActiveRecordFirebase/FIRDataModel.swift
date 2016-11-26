//  FIRDataModel.swift
//  Created by Victor Alisson on 24/11/16.
//  Copyright © 2016 Victor Alisson. All rights reserved.


import Foundation
import Firebase

protocol FIRDataModel: ModelType {
    
    typealias Reference = FIRDatabaseReference
    func toAnyObject() -> [String: AnyObject]
    
}

//Writeable
extension FIRDataModel {
    
    func save(completion: @escaping (_ error: Error?) -> Void) {
        Self.reference.child(Self.className).child(Self.autoId).setValue(self.toAnyObject()) { (error, reference) in
            completion(error)
        }
    }
    
    func save(id: String, completion: @escaping (_ error: Error?) -> Void){
        Self.reference.child(Self.className).child(id).setValue(self.toAnyObject()) { (error, reference) in
            completion(error)
        }
    }
}

extension FIRDataModel {
    
    func update(id: String, completion: @escaping (_ error: Error?) -> Void) {
        Self.reference.child(Self.className).child(id).updateChildValues(self.toAnyObject()) { (error, reference) in
            completion(error)
        }
    }
    
    func update(completion: @escaping (Error?) -> Void) {
        Self.reference.child(Self.className).child(Self.autoId).updateChildValues(self.toAnyObject()) { (error, reference) in
            completion(error)
        }
    }
}

//Deletable
extension FIRDataModel {
    
    func destroy(path: String, completion: @escaping (_ error: Error?) -> Void) {
        Self.reference.child(Self.className).child(path).removeValue { (error, reference) in
            completion(error)
        }
    }
}
//Readeable
extension FIRDataModel {
    
    static func asyncAll(completion: @escaping (_ json: JSON) -> Void) {
        
        Self.reference.child(Self.className).observe(.value, with: { snapshot in
            DispatchQueue.main.async {
                if snapshot.exists() {
                    completion((snapshot.value as! [String : AnyObject]?)!)
                }
            }
        })
    }
}


extension FIRDataModel {
    
    static var reference: FIRDatabaseReference {
        return FIRDatabase.database().reference()
    }
    
    static var className: String {
        return String(describing: self)
    }
    
    static var autoId: String {
        return Self.reference.childByAutoId().key
    }
}


