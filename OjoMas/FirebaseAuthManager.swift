//
//  FirebaseAuthManager.swift
//  OjoMas
//
//  Created by kkhjmldn on 16/08/19.
//  Copyright © 2019 kkhjmldn. All rights reserved.
//

import UIKit
import FirebaseAuth

class FirebaseAuthManager {
    
    
    func createUser( email: String, password: String, completionBlock:@escaping(_ success:Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult,error) in
            if let user = authResult?.user {
                print(user)
                completionBlock(true)
            } else {
                completionBlock(false)
            }
        }
        
    }
    
    func signIn(email:String, password:String,completionBlock:@escaping(_ success:Bool) -> Void) {
        Auth.auth().signIn(withEmail: email,password: password) { (result,error) in
            if let error = error ,let _ = AuthErrorCode(rawValue: error._code) {
                completionBlock(false)
            } else {
                completionBlock(true)
            }
            
        }
    }
}
