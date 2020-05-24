//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
        
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    // ...
                    if let error = error {
                        print(error.localizedDescription)
                        let ac = UIAlertController(title: "Error dring registration", message: error.localizedDescription, preferredStyle:.alert)
                        ac.addAction(UIAlertAction(title: "Bad", style: .default, handler: nil))
                        self.present(ac, animated: true)
                        // should be creating a popup and let user know
                        return
                    } else {
                        // navigate to chat view controller
                        // need to make sure that identifier is done well.
                        self.performSegue(withIdentifier: K.registerSegue, sender: self)
                    }
                }
            
        }
        
    }
    
}
