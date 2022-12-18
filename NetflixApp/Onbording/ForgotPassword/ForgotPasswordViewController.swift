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

        forgotpasswordview.delegate = self
        forgotpasswordview.setupUI()
    }

}
extension ForgotPasswordViewController: ForgotPasswordViewDelegate {
    func submitTapped() {
        let controller = Controller.resetpassword.getController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func backTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    
}
