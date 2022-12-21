//
//  ResetPasswordViewController.swift
//  NetflixApp
//
//  Created by Mac on 16/12/22.
//

import UIKit

class ResetPasswordViewController: BaseViewController {

    @IBOutlet weak var resetpasswordview: ResetPasswordView!
    var resetpasswordviewmodel: ResetPasswordViewModel = ResetPasswordViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resetpasswordviewmodel.delegate = self
        resetpasswordview.delegate = self
        resetpasswordview.setupUI()
    }
    
  
    func showAlert_vc(title: String, message: String) {
//        DispatchQueue.main.async {
//            let alertcontroller = UIAlertController(title: title, message: message, preferredStyle: .alert)
//            let okaction = UIAlertAction(title: "ok", style: .default){ Action in
//                let controller = Controller.register.getController()
//                self.navigationController?.pushViewController(controller, animated: true)
//            }
//
//            alertcontroller.addAction(okaction)
//
//            self.present(alertcontroller, animated: true)
//        }
        
    }
}
extension ResetPasswordViewController: ResetPasswordViewDelegate {
    func submitTapped(password: String?, confirmpassword: String?) {
        resetpasswordviewmodel.submitTapped(password: password, confirmpassword: confirmpassword)
    }
 
    func backTapped() {
        
        navigationController?.popViewController(animated: true)
    }
   
}
extension ResetPasswordViewController: ResetPasswordViewModelDelegate{
    func gotoLogin_vc() {
        showAlert(title: "Succes", message: "New Password Updated") {
            let controller = Controller.register.getController()
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    func showAlert(title: String, message: String) {
        showAlert(title: "raw", message: "raw") {
            
        }
    }
}
