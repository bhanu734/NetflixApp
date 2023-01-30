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
    case homeTab
    case categories
    case details
    case search
    case Account
    case settings
    case TabBar
    
    func getController() -> UIViewController {
        switch self {
        case .login:
            return UIStoryboard(name: "Onbording", bundle: nil).instantiateViewController(withIdentifier: "RegisterViewController")
        case .register:
            return UIStoryboard(name: "Onbording", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController")
        case .welcome:
            return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WelcomeViewController")
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
        case .homeTab:
            return UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController")
        case .categories:
            return UIStoryboard(name: "Others", bundle: nil).instantiateViewController(withIdentifier: "CategoriesViewController")
        case .details:
            return UIStoryboard(name: "Others", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController")
        case .search:
            return UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "SearchViewController")
        case .Account:
            return UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "AccountViewController")
        case .settings:
            return UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "SettingsViewController")
        case .TabBar:
            return UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "TabBarViewController")
        
        }
    }
}


