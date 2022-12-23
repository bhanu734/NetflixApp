//
//  LoginViewController.swift
//  NetflixApp
//
//  Created by Mac on 14/12/22.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var loginview : LoginView!
    var loginviewmodel: LoginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginviewmodel.delegate = self
        loginview.delegate = self
        loginview.setupUI()
    }
   
   
}
extension LoginViewController: LoginViewDelegate {
    func forgotpasswordTapped() {
        let contorller = Controller.forgotpassword.getController()
        
        navigationController?.pushViewController(contorller, animated: true)
    }
    
    func siginTapped(email: String?, password: String?) {
        loginviewmodel.siginTapped(email: email, password: password)
    }
    func registerTapped() {
        let contorller = Controller.login.getController()
        
        navigationController?.pushViewController(contorller, animated: true)
        
    }
    
}
extension LoginViewController: LoginViewModelDelegate {
    func gotoprofileselectionScreen() {
        DispatchQueue.main.async {
            let controller = Controller.profileselection.getController()
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
    }
    
    func gotoCreateprofilescreen() {
        DispatchQueue.main.async {
            let controller = Controller.createprofile.getController()
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
    }
    
    func showAlert(title: String, message: String) {
        showAlert(title: "", message: "") {
            
        }
    }
    
}
