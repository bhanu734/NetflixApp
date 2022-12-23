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
    case createprofile
    case profileimages
    case profileselection
    
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
        case .createprofile:
            return UIStoryboard(name: "Onbording", bundle: nil).instantiateViewController(withIdentifier: "CreateProfileViewController")
        case .profileimages:
            return UIStoryboard(name: "Onbording", bundle: nil).instantiateViewController(withIdentifier: "ProfileImageViewController")
        case .profileselection:
            return UIStoryboard(name: "Onbording", bundle: nil).instantiateViewController(withIdentifier: "ProfileSelectionViewController")
        }
    }
}


