//
//  CarousalCollectionViewCell.swift
//  NetflixApp
//
//  Created by Mac on 19/01/23.
//

import UIKit

class CarousalCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var caurosaltitle: UILabel!
    @IBOutlet weak var carousalcollectionview: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        carousalcollectionview.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        carousalcollectionview.delegate = self
        carousalcollectionview.dataSource = self
    }

}
extension CarousalCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = carousalcollectionview.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? ImageCollectionViewCell {
            cell.imageview.backgroundColor = UIColor.red
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}

extension CarousalCollectionViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

extension CarousalCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.zero
    }
}
