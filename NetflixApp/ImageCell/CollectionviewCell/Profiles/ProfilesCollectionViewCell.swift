//
//  ProfilesCollectionViewCell.swift
//  NetflixApp
//
//  Created by Mac on 23/12/22.
//

import UIKit

class ProfilesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var profileBG: UIView!
    @IBOutlet weak var profileimage: UIImageView!
    @IBOutlet weak var profilename: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }

    func setupUI() {
        
        profileBG.backgroundColor = Colors.shared.darkgreycolor
        profileBG.layer.cornerRadius = 10.0
        
        profilename.textColor = Colors.shared.whiteTextcolor
        profilename.font = Font.shared.semibold2
        
    }
    
    func configureUI(profile: Profile?) {
        if let profile = profile {
            profileimage.image = UIImage(named: profile.profileImage ?? "" )
            profilename.text = profile.profileName
        }
    }
    func configureUI() {
        profileimage.image = Images.shared.pluscircle
        profilename.text = ""
        profileimage.tintColor = Colors.shared.whiteimagecolor
    }
}
