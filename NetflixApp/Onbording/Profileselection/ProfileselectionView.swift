//
//  ProfileselectionView.swift
//  NetflixApp
//
//  Created by Mac on 22/12/22.
//

import UIKit

protocol ProfileselectionViewDelegate {
    func profile_selected(profile: Profile)
    func deleteProfile(profile: Profile)
    func showAlert(title: String, message: String)
    func goto_create_profile()
    func updateUI()
    func goto_homeScreen()
    func closeTapped()
}

class ProfileselectionView: UIView {

    @IBOutlet weak var navbarview: UIView!
    @IBOutlet weak var Headinglabel: UILabel!
    @IBOutlet weak var EditButton: UIButton!
    @IBOutlet weak var ButtonImageview: UIImageView!
    @IBOutlet weak var Collectionview: UICollectionView!
    @IBOutlet weak var closeview: UIView!
    @IBOutlet weak var closeimage: UIImageView!
    
    var hideclose: Bool = true
    var profiles : [Profile] = []
    var isEditing: Bool = false
    var delegate: ProfileselectionViewDelegate?
    
    func setupUI() {
        
        Collectionview.register(UINib(nibName: "ProfilesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProfilesCollectionViewCell")
        Collectionview.delegate = self
        Collectionview.dataSource = self
        Collectionview.reloadData()
        
        if hideclose {
            closeview.isHidden = true
        }else {
            closeview.backgroundColor = Colors.shared.darkgreycolor
            closeview.layer.cornerRadius = 20.0
            closeimage.tintColor = Colors.shared.whiteimagecolor
            closeimage.image = Images.shared.xmark
            
        }
        
        backgroundColor = Colors.shared.blackcolor
        navbarview.backgroundColor = Colors.shared.blackcolor
        Collectionview.backgroundColor = Colors.shared.blackcolor
        
        Headinglabel.text = Strings.shared.Who_is_watching
        Headinglabel.textColor = Colors.shared.whiteTextcolor
        Headinglabel.font = Font.shared.bold5
        
        EditButton.setTitle(Strings.shared.edit, for: .normal)
//        EditButton.tintColor = Colors.shared.whiteTextcolor
        EditButton.setTitleColor(Colors.shared.whiteTextcolor, for: .normal)
        EditButton.backgroundColor = Colors.shared.blackcolor
        EditButton.titleLabel?.font = Font.shared.bold3
        ButtonImageview.backgroundColor = Colors.shared.blackcolor
        updateProfilesUI()
    }
    
    @IBAction func editTapped() {
        isEditing = !isEditing
        updateProfilesUI()
    }
    
    func updateProfilesUI() {
        DispatchQueue.main.async {
        self.Collectionview.reloadData()
        }
    }
    @IBAction func close() {
        delegate?.closeTapped()
    }
}

extension ProfileselectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        if profiles.count >= 5 {
            return profiles.count
            
        }else {
            if isEditing {
                return profiles.count
                
            }
            return profiles.count + 1
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row < profiles.count {
            if let cell = Collectionview.dequeueReusableCell(withReuseIdentifier: "ProfilesCollectionViewCell", for: indexPath) as? ProfilesCollectionViewCell {
                cell.configureUI(profile: profiles[indexPath.row])
                cell.deleteview.isHidden = !isEditing
                return cell
            }
        }else {
            if let cell = Collectionview.dequeueReusableCell(withReuseIdentifier: "ProfilesCollectionViewCell", for: indexPath) as? ProfilesCollectionViewCell {
                cell.configureUI()
                cell.deleteview.isHidden = true
                return cell
            }
        }
        
        
        return UICollectionViewCell()
    }
    
}
extension ProfileselectionView: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row < profiles.count {
            if isEditing {
                if profiles.count > 1 {
                    delegate?.deleteProfile(profile: profiles[indexPath.row])
                    
                    updateProfilesUI()
                }else {
                    print("minimum one profile nedded")
                    delegate?.showAlert(title: Strings.shared.error_title, message: Strings.shared.minimum_one_profile_must)
                }
            }else {
                User.shared.selectedProfile = profiles[indexPath.row]
                delegate?.goto_homeScreen()
                print("profile tapped go to home")
            }
            
        } else {
            delegate?.goto_create_profile()
            print("go to create profile next proceed")
        }
       
    }
}
extension ProfileselectionView: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (Collectionview.frame.width-20)/2, height: ((Collectionview.frame.width-20)/2) + 20)
    }
}
