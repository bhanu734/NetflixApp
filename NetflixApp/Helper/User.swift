//
//  User.swift
//  NetflixApp
//
//  Created by Mac on 23/12/22.
//

import UIKit

class User {
    static let shared: User = User()
 
    var userdetails: UserDetails? {
        didSet {
            saveUser(userDetails: userdetails)
        }
    }
    
//    let email = UserDefaults.standard.value(forKey: email_UD)?
    
    var isLogin : Bool {
        if let _ = UserDefaults.standard.value(forKey: email_UD) as? String {
            
            return true
        } else {
            
            return false
        }
    }
    var email: String? {
        if let email = UserDefaults.standard.value(forKey: email_UD) as? String {
            return email
        }else {
            return nil
        }
    }
    
    private func saveUser(userDetails: UserDetails?) {
        if let email = userdetails?.email {
            
            UserDefaults.standard.setValue(email , forKey: email_UD)
        }else {
            UserDefaults.standard.removeObject(forKey: email_UD)
        }
        
    }
    
    func logout_user() {
       
        User.shared.userdetails = nil
    }
}
