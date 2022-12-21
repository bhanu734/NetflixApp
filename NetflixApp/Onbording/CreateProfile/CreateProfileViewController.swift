//
//  CreateProfileViewController.swift
//  NetflixApp
//
//  Created by Mac on 19/12/22.
//

import UIKit


class CreateProfileViewController: UIViewController {

    @IBOutlet weak var createprofileview: CreateProfileView!
    var createprofileviewmodel: CreateProfileViewModel = CreateProfileViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createprofileview.setupUI()
        createprofileview.backgroundColor = UIColor.black
        createprofileview.delegate = self
    }

}
extension CreateProfileViewController: CreateProfileViewDelegate{
    func ProfileImageTapped() {
        let controller = Controller.profileimages.getController()
        controller.modalPresentationStyle = .overFullScreen
        present(controller, animated: true, completion: nil)
    }
    
    
}
