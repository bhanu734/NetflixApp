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
    
    var delegate: AccountViewDelegate?
    var profiles: [Profile] = []
    
    func setupUI() {
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
            cell.configureUI_accountVC(profile: profiles[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}
extension AccountView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: profilecollectionview.frame.width/5 , height: (profilecollectionview.frame.width)/5 + 21 )
    }
}
