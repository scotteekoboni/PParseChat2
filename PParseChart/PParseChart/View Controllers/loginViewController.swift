//
//  loginViewController.swift
//  PParseChart
//
//  Created by Scott Guidoboni on 2/2/18.
//  Copyright © 2018 doordontLLC. All rights reserved.
//

import UIKit
import Parse

class loginViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func signUpButton(_ sender: Any) {
        
        
        // initialize a user object
        let newUser = PFUser()
        
        // set user properties
        newUser.username = usernameField.text
        //newUser.email = emailLabel.text
        newUser.password = passwordField.text
        
        // call sign up function on the object
        newUser.signUpInBackground { (success, error) in
            if success {
                print("User Registered successfully. good job boyo")
                
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                
            } else {
                
                print(error?.localizedDescription)
            }
        }
        
        
    }
    
    @IBAction func loginButton(_ sender: Any) {
        
        
        
        let username = usernameField.text ?? ""
        let password = passwordField.text ?? ""
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
            if let error = error {
                print("User log in failed: \(error.localizedDescription)")
            } else {
                print("User logged in successfully")
                self.performSegue(withIdentifier: "loginSegue", sender: nil) //IDK about this placement
            }
        }
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
