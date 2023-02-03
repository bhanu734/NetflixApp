//
//  AccountView.swift
//  NetflixApp
//
//  Created by Mac on 30/01/23.
//

import UIKit

protocol AccountViewDelegate {
    func closedTapped()
}

class AccountView: UIView {

    @IBOutlet weak var closeview: UIView!
    @IBOutlet weak var closeimage: UIImageView!
    @IBOutlet weak var profilecollectionview: UICollectionView!
//    @IBOutlet weak var collectionviewWidth: NSLayoutConstraint!
    
    var delegate: AccountViewDelegate?
    var profiles: [Profile] = []
    
    func setupUI() {
//        collectionviewWidth.constant = (CGFloat(profiles.count) * PROFILE_WIDTH) + (CGFloat(profiles.count - 1)*5)
            
        backgroundColor = Colors.shared.blackcolor
        closeview.backgroundColor = Colors.shared.blackcolor
        closeimage.image = Images.shared.crossimage
        closeimage.tintColor = Colors.shared.whiteimagecolor
        
        profilecollectionview.backgroundColor = Colors.shared.blackcolor
        
        profilecollectionview.register(UINib(nibName: "ProfilesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProfilesCollectionViewCell")
        profilecollectionview.delegate = self
        profilecollectionview.dataSource = self
    }
    func updateUI() {
        DispatchQueue.main.async {
            self.profilecollectionview.reloadData()
        }
    }
    @IBAction func closeTap() {
        delegate?.closedTapped()
    }
}
extension AccountView: UICollectionViewDelegate {
    
}
extension AccountView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profiles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = profilecollectionview.dequeueReusableCell(withReuseIdentifier: "ProfilesCollectionViewCell", for: indexPath) as? ProfilesCollectionViewCell {
            if User.shared.selectedProfile?.profileID == profiles[indexPath.row].profileID {
                cell.configureUI_accountVC(profile: profiles[indexPath.row], isSelected: true)
                return cell
            }else {
                cell.configureUI_accountVC(profile: profiles[indexPath.row], isSelected: false)
                return cell
            }
            
        }
        return UICollectionViewCell()
    }
    
    
}
extension AccountView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: PROFILE_WIDTH , height: PROFILE_HEIGHT )
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
