//
//  ForgotPasswordViewController.swift
//  NetflixApp
//
//  Created by Mac on 16/12/22.
//

import UIKit

class ForgotPasswordViewController: BaseViewController {

    @IBOutlet weak var forgotpasswordview: ForgotPasswordView!
    var forgotpasswordviewmodel: ForgotPasswordViewModel = ForgotPasswordViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        forgotpasswordviewmodel.delegate = self
        forgotpasswordview.delegate = self
        forgotpasswordview.setupUI()
    }
    
   
}
extension ForgotPasswordViewController: ForgotPasswordViewDelegate {

    func submitTapped(email: String?, dob: String?) {
        forgotpasswordviewmodel.submitTapped(email: email, dob: dob)
    
    
    }
    func backTapped() {
        navigationController?.popViewController(animated: true)
    }
   
}
extension ForgotPasswordViewController: ForgotPasswordViewModelDelegate{
    func goto_resetpassword_vc(email: String) {
        DispatchQueue.main.async {
            if let controller = Controller.resetpassword.getController() as? ResetPasswordViewController  {
                controller.resetpasswordviewmodel.email = email
                self.navigationController?.pushViewController(controller, animated: true)
            }
        }
   }
    func showAlert(title: String, message: String) {
        showAlert(title: "", message: "") {
            
        }
    }
}
