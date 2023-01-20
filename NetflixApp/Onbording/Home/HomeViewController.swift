//
//  HomeViewController.swift
//  NetflixApp
//
//  Created by Mac on 10/01/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeview: HomeView!
    var homeviewmodel: HomeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        homeview.setupUI()
        homeview.homedata = homeviewmodel.homedata
        homeview.updateUI()
    }
    

   

}
