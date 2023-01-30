//
//  ProfileSelectionViewController.swift
//  NetflixApp
//
//  Created by Mac on 22/12/22.
//

import UIKit

class ProfileSelectionViewController: BaseViewController {

    @IBOutlet weak var profileselectionview: ProfileselectionView!
    var profileselectionviewmodel: ProfileSelectionViewModel = ProfileSelectionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileselectionview.delegate = self
        profileselectionviewmodel.delegate = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        profileselectionview.profiles = profileselectionviewmodel.profiles
        profileselectionview.setupUI()
       
    }
    

}
extension ProfileSelectionViewController: ProfileSelectionViewModelDelegate {
    func updateui() {
        profileselectionview.profiles = profileselectionviewmodel.profiles
       
        profileselectionview.editTapped()
    }
    
    func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
            let alertcontroller = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okaction = UIAlertAction(title: "ok", style: .default){ Action in
                
            }
            
            alertcontroller.addAction(okaction)
            
            self.present(alertcontroller, animated: true)
        }
    }

    
}

extension ProfileSelectionViewController: ProfileselectionViewDelegate {
    func goto_homeScreen() {
        DispatchQueue.main.async {
            let controller = Controller.TabBar.getController()
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
    }
    
    func updateUI() {
        
    }
    
    func profile_selected(profile: Profile) {
        print(" Go to home")
        
    }
    
    func deleteProfile(profile: Profile) {
        profileselectionviewmodel.deleteProfile(profile: profile)
    }
    
    func goto_create_profile() {
        DispatchQueue.main.async {
            let controller = Controller.createprofile.getController()
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
    }
}
