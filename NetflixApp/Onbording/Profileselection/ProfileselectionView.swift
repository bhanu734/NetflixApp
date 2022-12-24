//
//  ProfileselectionView.swift
//  NetflixApp
//
//  Created by Mac on 22/12/22.
//

import UIKit

class ProfileselectionView: UIView {

    @IBOutlet weak var navbarview: UIView!
    @IBOutlet weak var Headinglabel: UILabel!
    @IBOutlet weak var EditButton: UIButton!
    @IBOutlet weak var ButtonImageview: UIImageView!
    @IBOutlet weak var Collectionview: UICollectionView!

    
    var profiles : [Profile] = []
    
    func setupUI() {
        
        Collectionview.register(UINib(nibName: "ProfilesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProfilesCollectionViewCell")
        Collectionview.delegate = self
        Collectionview.dataSource = self
        
        
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
       
    }
}

extension ProfileselectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        if profiles.count < 5 {
            return profiles.count + 1
        }else {
            return profiles.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row < profiles.count {
            if let cell = Collectionview.dequeueReusableCell(withReuseIdentifier: "ProfilesCollectionViewCell", for: indexPath) as? ProfilesCollectionViewCell {
                cell.configureUI(profile: profiles[indexPath.row])
                return cell
            }
        }else {
            if let cell = Collectionview.dequeueReusableCell(withReuseIdentifier: "ProfilesCollectionViewCell", for: indexPath) as? ProfilesCollectionViewCell {
                cell.configureUI()
                return cell
            }
        }
        
        
        return UICollectionViewCell()
    }
    
}
extension ProfileselectionView: UICollectionViewDelegate{
    
}
extension ProfileselectionView: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (Collectionview.frame.width-20)/2, height: ((Collectionview.frame.width-20)/2) + 20)
    }
}
