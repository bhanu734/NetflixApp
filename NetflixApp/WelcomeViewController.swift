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
    }
    


}
