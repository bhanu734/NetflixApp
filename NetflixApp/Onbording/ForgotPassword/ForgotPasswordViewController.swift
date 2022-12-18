//
//  ForgotPasswordViewController.swift
//  NetflixApp
//
//  Created by Mac on 16/12/22.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var forgotpasswordview: ForgotPasswordView!
    var forgotpasswordviewmodel: ForgotPasswordViewModel = ForgotPasswordViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        forgotpasswordviewmodel.delegate = self
        forgotpasswordview.delegate = self
        forgotpasswordview.setupUI()
    }
    
    func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
            let alertcontroller = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okaction = UIAlertAction(title: "ok", style: .default)
            alertcontroller.addAction(okaction)
            self.present(alertcontroller, animated: true)
        }
        
    }

}
extension ForgotPasswordViewController: ForgotPasswordViewDelegate {
//    func submitTapped() {
//        let controller = Controller.resetpassword.getController()
//        navigationController?.pushViewController(controller, animated: true)
//    }
    func submitTapped(email: String?, dob: String?) {
        forgotpasswordviewmodel.submitTapped(email: email, dob: dob)
    
    
    }
    func backTapped() {
        navigationController?.popViewController(animated: true)
    }
   
}
extension ForgotPasswordViewController: ForgotPasswordViewModelDelegate{
    
}
