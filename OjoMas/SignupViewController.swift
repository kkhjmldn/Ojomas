//
//  SignupViewController.swift
//  OjoMas
//
//  Created by kkhjmldn on 16/08/19.
//  Copyright © 2019 kkhjmldn. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth

class  SignupViewController: UIViewController{
    
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func login(_ sender:UIButton) {
        print("login()")
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signupViewController = storyBoard.instantiateViewController(withIdentifier: "firstPage")
        self.present(signupViewController, animated: true,completion: nil)
    }
    
    @IBAction func createAccount(_ sender:UIButton) {
        print("createAccount()")
        let signupManager = FirebaseAuthManager()
        if let email = emailTextField.text, let password = passwordTextField.text {
            signupManager.createUser(email: email, password: password) { [weak self] (success) in
                guard let `self` = self else {return}
                var message:String = ""
                if (success) {
                    message = "Successfully create User"
                } else {
                    message = "Failed create User"
                }
                
                let alertController = UIAlertController(title:nil,message:message,preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title:"OK",style:.cancel,handler:nil))
                self.present(alertController,animated: true,completion: nil)
                
            }
        }
       
        
    }
    
    
}
