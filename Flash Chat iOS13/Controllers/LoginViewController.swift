//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
 


    @IBAction func loginPressed(_ sender: UIButton) {

        guard let email = emailTextfield.text, let password = passwordTextfield.text else  { return }

        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            
            if let error = error {
                print (error)
                // how to show the notification
                let ac = UIAlertController(title: "Authentication Error!", message: error.localizedDescription, preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Retry", style: .default, handler: nil))
                self?.present(ac, animated: true, completion: nil)
                return
            }
            self?.performSegue(withIdentifier: K.loginSegue, sender: self)
          // ...
        }
    }
    
}
