//
//  Controller.swift
//  NetflixApp
//
//  Created by Mac on 16/12/22.
//

import UIKit

enum Controller {
    case welcome
    case login
    case register
    case forgotpassword
    case resetpassword
    
    func getController() -> UIViewController {
        switch self {
        case .login:
            return UIStoryboard(name: "Onbording", bundle: nil).instantiateViewController(withIdentifier: "RegisterViewController")
        case .register:
            return UIStoryboard(name: "Onbording", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController")
        case .welcome:
            return UIStoryboard(name: "main", bundle: nil).instantiateViewController(withIdentifier: "WelcomeViewController")
        case .forgotpassword:
            return UIStoryboard(name: "Onbording", bundle: nil).instantiateViewController(withIdentifier: "ForgotPasswordViewController")
        case .resetpassword:
            return UIStoryboard(name: "Onbording", bundle: nil).instantiateViewController(withIdentifier: "ResetPasswordViewController")
        }
    }
}


