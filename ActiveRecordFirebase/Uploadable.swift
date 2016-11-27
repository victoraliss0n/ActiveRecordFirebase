//  Uploadable.swift
//  Created by Victor Alisson on 24/11/16.
//  Copyright © 2016 Victor Alisson. All rights reserved.

import UIKit
import FirebaseStorage
import FirebaseAuth

protocol Uploadable {
    
    static func upload<T: FIRDataModel>(data: Data, entity: T, completion: @escaping (_ url: String) -> Void)
    
}

extension Uploadable {
    
    static var storageRef: FIRStorageReference {
        return FIRStorage.storage().reference()
    }
    
    static var metadata: FIRStorageMetadata {
        return FIRStorageMetadata()
    }
    
    static func upload<T: FIRDataModel>(data: Data, entity: T, completion: @escaping (_ url: String) -> Void) {
        
        let imgUid = NSUUID().uuidString
        let ref =  Self.storageRef.child("imagens/\(T.className)/\(T.autoId)/\(imgUid)")
        
        let uploadTask = ref.put(data, metadata: metadata) { (metadata, error) in
            
            if error != nil {
                print(error?.localizedDescription as Any)
            }
            else {
                guard let urlStorage = metadata?.downloadURL()!.absoluteString else {
                    return
                }
                completion(urlStorage)
            }
        }
        uploadTask.resume()
    }
    
}

