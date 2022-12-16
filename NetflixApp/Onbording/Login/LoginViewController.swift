//
//  LoginViewController.swift
//  NetflixApp
//
//  Created by Mac on 14/12/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginview : LoginView!
    var loginviewmodel: LoginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginviewmodel.delegate = self
        loginview.delegate = self
        loginview.setupUI()
    }
   
    func showalert(title: String, message: String) {
        DispatchQueue.main.async {
            let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okaction = UIAlertAction(title: "ok", style: .default)
            controller.addAction(okaction)
            self.present(controller, animated: true, completion: nil)
        }
    }
}
extension LoginViewController: LoginViewDelegate {
    func siginTapped(email: String?, password: String?) {
        loginviewmodel.siginTapped(email: email, password: password)
    }
    func registerTapped() {
        let contorller = UIStoryboard(name: "Onbording", bundle: nil).instantiateViewController(withIdentifier: "RegisterViewController")
        navigationController?.pushViewController(contorller, animated: true)
        
    }
}
extension LoginViewController: LoginViewModelDelegate {
    
}
