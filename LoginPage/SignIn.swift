//
//  SignIn.swift
//  LoginPage
//
//  Created by Imran Sifat on 11/10/20.
//  Copyright © 2020 Imran Sifat. All rights reserved.
//

import UIKit
import Firebase
class SignIn: UIViewController {
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var loginLBL: UILabel!
    @IBOutlet weak var SignInOutlet: UIButton!
    
    var isSignIn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func segmentButtonClicked(_ sender: Any) {
        isSignIn = !isSignIn
        if isSignIn{
            loginLBL.text = "Sign in"
            SignInOutlet.setTitle("Sign in", for: .normal)
            emailTextField.text = ""
            passTextField.text = ""
        }else{
            loginLBL.text = "Sign Up"
            SignInOutlet.setTitle("Sign Up", for: .normal)
            emailTextField.text = ""
            passTextField.text = ""
        }
    }
    
    @IBAction func SignIn(_ sender: Any) {
        if let email = emailTextField.text , let password = passTextField.text{
            if isSignIn{
                Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                    if let u = user{
                        self.performSegue(withIdentifier: "segue", sender: self)
                    }else{
                        
                    }
                }
            }else{
                Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                    if let u = user{
                        self.performSegue(withIdentifier: "segue", sender: self)
                    }else{
                        
                    }
                }
            }
        }else{
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        emailTextField.resignFirstResponder()
        passTextField.resignFirstResponder()
    }
    
}

