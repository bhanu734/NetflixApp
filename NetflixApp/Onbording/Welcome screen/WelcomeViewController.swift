//
//  WelcomeViewController.swift
//  NetflixApp
//
//  Created by Mac on 09/12/22.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeview: WelcomeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        welcomeview.setupUI()
        welcomeview.delegate = self
    }
    
    
}
extension WelcomeViewController: WelcomeViewDelegate{
    func signinTapped() {
        DispatchQueue.main.async {
            let controller = Controller.register.getController()
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func getstartedTapped() {
        DispatchQueue.main.async {
            let controller = Controller.login.getController()
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func privacyTapped() {
        
    }
    
    
}
