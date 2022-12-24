//
//  ProfileSelectionViewController.swift
//  NetflixApp
//
//  Created by Mac on 22/12/22.
//

import UIKit

class ProfileSelectionViewController: UIViewController {

    @IBOutlet weak var profileselectionview: ProfileselectionView!
    var profileselectionviewmodel: ProfileSelectionViewModel = ProfileSelectionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileselectionview.profiles = profileselectionviewmodel.profiles
        profileselectionview.setupUI()
    }
    

}
