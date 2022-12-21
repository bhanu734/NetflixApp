//
//  ProfileImageView.swift
//  NetflixApp
//
//  Created by Mac on 20/12/22.
//

import UIKit

class ProfileImageView: UIView {

    @IBOutlet weak var navbarview: UIView!
    @IBOutlet weak var logoimage: UIImageView!
    @IBOutlet weak var closebutton: UIButton!
    @IBOutlet weak var collectionview : UICollectionView!
    
    var images : [String] = []
    
    func setupUI() {
        backgroundColor = Colors.shared.blackcolor
        navbarview.backgroundColor = Colors.shared.blackcolor
        collectionview.backgroundColor = Colors.shared.blackcolor
        
        collectionview.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        collectionview.delegate = self
        collectionview.dataSource = self
        
        logoimage.image = Images.shared.netflixlogo
        logoimage.contentMode = .scaleAspectFill
        
        closebutton.setImage(Images.shared.editimage, for: .normal)
        closebutton.tintColor = Colors.shared.whiteimagecolor
    }
    
}
extension ProfileImageView: UICollectionViewDelegate {

}
extension ProfileImageView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? ImageCollectionViewCell {
            cell.configUI(imageName: images[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
}
extension ProfileImageView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionview.frame.width-30)/4, height: (collectionview.frame.width-30)/4)
    }
}
