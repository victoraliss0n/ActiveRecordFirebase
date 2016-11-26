//
//  SignInViewController.swift
//  ActiveRecordFirebase
//
//  Created by Victor Alisson on 26/11/16.
//  Copyright © 2016 Victor Alisson. All rights reserved.
//

import UIKit

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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
