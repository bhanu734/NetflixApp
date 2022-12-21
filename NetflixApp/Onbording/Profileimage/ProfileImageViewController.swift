//
//  ProfileImageViewController.swift
//  NetflixApp
//
//  Created by Mac on 20/12/22.
//

import UIKit

class ProfileImageViewController: UIViewController {

    var profileimageviewmodel: ProfileImageViewModel = ProfileImageViewModel()
    @IBOutlet weak var profileimageview: ProfileImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileimageviewmodel.getImages()
        profileimageview.images = profileimageviewmodel.images
        profileimageview.setupUI()
        
    }

}
