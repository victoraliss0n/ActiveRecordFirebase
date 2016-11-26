//
//  AuthService.swift
//  ActiveRecordFirebase
//
//  Created by Victor Alisson on 25/11/16.
//  Copyright © 2016 Victor Alisson. All rights reserved.
//

import Foundation
import Firebase
import SVProgressHUD

class AuthService {
 
    
    func createUser(email: String, password: String) {
        
        let firUser = User()
    
        SVProgressHUD.show(withStatus: "Cadastrando")
        
        FIRAuth.auth()?.createUser(withEmail: email, password: password) { (user, error) in
            
            if error == nil {
                firUser.email = email
                firUser.password = password
                
                firUser.save(id: (user?.uid)!, completion: {(error) in
                    
                    if error != nil {
                        print(error?.localizedDescription as Any)
                        return
                    }
                        
                    else {
                        SVProgressHUD.showSuccess(withStatus: "Usuário Cadastrado")
                        self.getInstanceRootViewController()?.dismiss(animated: true, completion: nil)
                    }
                })
            }
            else {
                print("Bug: \(error?.localizedDescription)")
                SVProgressHUD.dismiss()
            }
        }
    }
    
    fileprivate func getInstanceRootViewController() -> UIViewController? {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.window?.rootViewController
    }
}
