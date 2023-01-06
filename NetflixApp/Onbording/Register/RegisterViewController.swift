//
//  RegisterViewController.swift
//  NetflixApp
//
//  Created by Mac on 12/12/22.
//

import UIKit

class RegisterViewController: BaseViewController {

    @IBOutlet weak var registerview: RegisterView!
    var registerviewmodel: RegisterViewModel = RegisterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerviewmodel.delegate = self
        registerview.delegate = self
        registerview.setupUI()
    }
    
    func showAlert_vc(title: String, message: String) {
        DispatchQueue.main.async {
            let alertcontroller = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okaction = UIAlertAction(title: "ok", style: .default){ Action in
                let controller = Controller.register.getController()
                self.navigationController?.pushViewController(controller, animated: true)
            }
            
            alertcontroller.addAction(okaction)
            
            self.present(alertcontroller, animated: true)
        }
        
    }

}
extension RegisterViewController : RegisterViewDelegate {
    func registerTapped(email: String?, password: String?, Confirm_password: String?, Dateofbirth: String?) {
        registerviewmodel.registerTapped(email: email, password: password, Confirm_password: Confirm_password, Dateofbirth: Dateofbirth)
    }
    
    func siginTapped() {
        let contorller = Controller.register.getController()
      
            navigationController?.pushViewController(contorller, animated: true)
        
    }
    
    
}
extension RegisterViewController: RegisterViewModelDelgate {
    func showAlert(title: String, message: String) {
        showAlert(title: title, message: message) {
            
        }
    }
}
