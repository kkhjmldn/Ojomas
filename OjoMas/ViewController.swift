//
//  ViewController.swift
//  OjoMas
//
//  Created by kkhjmldn on 05/08/19.
//  Copyright © 2019 kkhjmldn. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUp(_ sender:UIButton) {
        print("signup")
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signupViewController = storyBoard.instantiateViewController(withIdentifier: "signupPage")
        self.present(signupViewController, animated: true,completion: nil)
    }
    
    @IBAction func login(_ sender:UIButton) {
        print("login() first page")
        let loginManager = FirebaseAuthManager()
        guard let email = emailTextField.text,let password=passwordTextField.text else { return }
        loginManager.signIn(email: email, password: password) {[weak self] (success) in
            guard let `self` = self else {return}
            var message:String = ""
            
            if (success) {
                message = "Successfully Logged in"
            } else {
                message = "Falied Log in"
            }
            
            let alertController = UIAlertController(title:nil, message:message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title:"OK", style:.cancel, handler:nil))
            self.present(alertController, animated: true, completion: nil)
            
         }
        
    }
    
    
    

    


}

