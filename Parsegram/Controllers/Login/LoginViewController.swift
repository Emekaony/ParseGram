//
//  LoginViewController.swift
//  Parsegram
//
//  Created by SHAdON . on 10/14/22.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Log in"
        
        usernameField.setLeftPaddingPoints(10)
        usernameField.setRightPaddingPoints(10)
        passwordField.setLeftPaddingPoints(10)
        passwordField.setRightPaddingPoints(10)
        
    }
    
    @IBAction func signInPressed(_ sender: UIButton) {
        if let username = usernameField.text, let password = passwordField.text {
            PFUser.logInWithUsername(inBackground: username, password: password) { user, error in
                if user != nil {
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                } else {
                    let alert = UIAlertController(title: "Error Signing In", message: "Please enter valid credentials", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "cancel", style: .cancel))
                    alert.addAction(UIAlertAction(title: "ok", style: .default))
                    
                    self.present(alert, animated: false)
                    print("Error signing in, ", error?.localizedDescription as Any)
                }
            }
        }
    
    }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        
        user.signUpInBackground { success, error in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                let alert = UIAlertController(title: "Error Signing In", message: "Please enter valid credentials", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "cancel", style: .cancel))
                alert.addAction(UIAlertAction(title: "ok", style: .default))
                
                self.present(alert, animated: false)
                print("Error signing up, ", error?.localizedDescription)
            }
        }
        
   
    }
    
}
