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

    @IBOutlet weak var manageProfileview: UIView!
    @IBOutlet weak var managePrrofileimage: UIImageView!
    @IBOutlet weak var manageProfileLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var signOutLabel: UILabel!
    @IBOutlet weak var versionLabel: UILabel!
    @IBOutlet weak var accountTableview: UITableView!
    @IBOutlet weak var closeview: UIView!
    @IBOutlet weak var closeimage: UIImageView!
    @IBOutlet weak var profilecollectionview: UICollectionView!

    
    var delegate: AccountViewDelegate?
    var profiles: [Profile] = []
    var accountsettings: [AccountSettings] = []
    
    func setupUI() {
//        collectionviewWidth.constant = (CGFloat(profiles.count) * PROFILE_WIDTH) + (CGFloat(profiles.count - 1)*5)
            
        backgroundColor = Colors.shared.blackcolor
        closeview.backgroundColor = Colors.shared.blackcolor
        closeimage.image = Images.shared.crossimage
        closeimage.tintColor = Colors.shared.whiteimagecolor
        
        profilecollectionview.backgroundColor = Colors.shared.blackcolor
        
        manageProfileview.backgroundColor = Colors.shared.blackcolor
        managePrrofileimage.image = Images.shared.pencil
        managePrrofileimage.tintColor = Colors.shared.whiteimagecolor
        manageProfileLabel.text = Strings.shared.manageProfiles
        manageProfileLabel.textColor = Colors.shared.whiteTextcolor
        
        accountTableview.backgroundColor = Colors.shared.blackcolor
        accountTableview.isOpaque = false
        
        stackView.backgroundColor = Colors.shared.blackcolor
        signOutLabel.textColor = Colors.shared.whiteTextcolor
        signOutLabel.text = Strings.shared.signOut
        
        versionLabel.textColor = Colors.shared.whiteTextcolor
        versionLabel.text = Strings.shared.signOut
        
        profilecollectionview.register(UINib(nibName: "ProfilesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProfilesCollectionViewCell")
        profilecollectionview.delegate = self
        profilecollectionview.dataSource = self
        
        accountTableview.register(UINib(nibName: "AccountTableViewCell", bundle: nil), forCellReuseIdentifier: "AccountTableViewCell")
        accountTableview.delegate = self
        accountTableview.dataSource = self
    }
    func updateUI() {
        DispatchQueue.main.async {
            self.profilecollectionview.reloadData()
        }
    }
    @IBAction func closeTap() {
        delegate?.closedTapped()
    }
    @IBAction func manageProfileTap() {
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
    
}

extension AccountView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
extension AccountView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accountsettings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = accountTableview.dequeueReusableCell(withIdentifier: "AccountTableViewCell", for: indexPath) as? AccountTableViewCell {
            cell.configureUI(accountsetting: accountsettings[indexPath.row])
            
            return cell
        }
        return UITableViewCell()
    }
    
    
}
