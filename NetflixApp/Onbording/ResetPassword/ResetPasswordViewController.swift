//
//  ResetPasswordViewController.swift
//  NetflixApp
//
//  Created by Mac on 16/12/22.
//

import UIKit

class ResetPasswordViewController: UIViewController {

    @IBOutlet weak var resetpasswordview: ResetPasswordView!
    var resetpasswordviewmodel: ResetPasswordViewModel = ResetPasswordViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resetpasswordview.delegate = self
        resetpasswordview.setupUI()
    }
}
extension ResetPasswordViewController: ResetPasswordViewDelegate {
    func submitTapped() {
        let controller = Controller.register.getController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func backTapped() {
        
        navigationController?.popViewController(animated: true)
    }
    
    
}
