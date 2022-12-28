//
//  CreateProfileViewController.swift
//  NetflixApp
//
//  Created by Mac on 19/12/22.
//

import UIKit

protocol CreateProfileViewControllerDelegate {
    
}

class CreateProfileViewController: UIViewController, CreateProfileViewControllerDelegate {

    @IBOutlet weak var createprofileview: CreateProfileView!
    var createprofileviewmodel: CreateProfileViewModel = CreateProfileViewModel()
    
    var delegate: CreateProfileViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createprofileview.delegate = self
        createprofileviewmodel.delegate = self
        createprofileview.setupUI()
        createprofileview.backgroundColor = UIColor.black
        
    }

}
extension CreateProfileViewController: CreateProfileViewDelegate {
    func createbuttonTapped(profilename: String?, profileimage: String) {
        createprofileviewmodel.CreateProfile(profileName: profilename, profileImage: profileimage)
    }
    
    
    
    func ProfileImageTapped() {
       if let controller = Controller.profileimages.getController() as? ProfileImageViewController {
            controller.modalPresentationStyle = .overFullScreen
            controller.delegate = self
            present(controller, animated: true, completion: nil)
        }
        
    }
}
extension CreateProfileViewController: ProfileImageViewControllerDelegate {
    func sendSelectedimage(image: String) {
        createprofileview.updateUI(image: image)
    }
    
    
}
extension CreateProfileViewController: CreateProfileViewModelDelegate {
    func GotoProfilesscreen() {
        DispatchQueue.main.async {
            let controller = Controller.profileselection.getController()
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func goToPreviousVc() {
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}
