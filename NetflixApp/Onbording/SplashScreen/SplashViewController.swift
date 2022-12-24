//
//  SplashViewController.swift
//  NetflixApp
//
//  Created by Mac on 23/12/22.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var splashview: SplashView!
    var splashviewmodel: SplashViewModel = SplashViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        splashview.setupUI()
    }
    override func viewDidAppear(_ animated: Bool) {
        splashview.animateGifimage()
    }
}
