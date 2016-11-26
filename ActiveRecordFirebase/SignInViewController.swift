//
//  SignInViewController.swift
//  ActiveRecordFirebase
//
//  Created by Victor Alisson on 26/11/16.
//  Copyright © 2016 Victor Alisson. All rights reserved.
//

import UIKit
import SCLAlertView
class SignInViewController: UIViewController {

    let authService = AuthService()
    
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signIn(_ sender: Any) {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        authService.signIn(email: email, password: password)
    }
    @IBAction func forgotPassword(_ sender: Any) {
       
        let scl = SCLAlertView()
        let email = scl.addTextField("Digite seu email")
        
        scl.showInfo("Resetar senha", subTitle: "Um email será enviado dentro de instantes").setDismissBlock {
            self.authService.resetPassword(email: email.text!)
        }
        
       
    }

}
