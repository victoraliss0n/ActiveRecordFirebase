//
//  CadastroViewController.swift
//  ActiveRecordFirebase
//
//  Created by Victor Alisson on 25/11/16.
//  Copyright © 2016 Victor Alisson. All rights reserved.
//

import UIKit
import SVProgressHUD
class CadastroViewController: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private let authService = AuthService()
    
    @IBAction func registerUser(_ sender: Any) {
        
        guard let email = emailTextField.text, let password = passwordTextField.text, let confirmPassword = confirmPasswordTextField.text else {
            return
        }
        if password != confirmPassword {
            SVProgressHUD.showError(withStatus: "Confirme corretamente sua senha")
        }
        else {
            authService.createUser(email: email, password: password)
        }
        
    }
    


    @IBAction func back(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController?.dismiss(animated: true, completion: nil)
        
        
    }
}
