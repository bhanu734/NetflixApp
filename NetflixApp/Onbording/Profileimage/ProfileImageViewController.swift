//
//  ProfileImageViewController.swift
//  NetflixApp
//
//  Created by Mac on 20/12/22.
//

import UIKit

protocol ProfileImageViewControllerDelegate {
    func sendSelectedimage(image: String)
}

class ProfileImageViewController: UIViewController {

    var profileimageviewmodel: ProfileImageViewModel = ProfileImageViewModel()
    @IBOutlet weak var profileimageview: ProfileImageView!
    
    var delegate: ProfileImageViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileimageview.delegate = self
        profileimageviewmodel.getImages()
        profileimageview.images = profileimageviewmodel.images
        profileimageview.setupUI()
        
    }

}
extension ProfileImageViewController: ProfileImageViewDelegate{
    func selectedImage(image: String) {
        delegate?.sendSelectedimage(image: image)
        closebuttontapped()
    }
    
    func closebuttontapped() {
        dismiss(animated: true) {
            
        }
    }
}
