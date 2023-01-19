//
//  HomeView.swift
//  NetflixApp
//
//  Created by Mac on 10/01/23.
//

import UIKit

class HomeView: UIView {

    @IBOutlet weak var homecollectionview: UICollectionView!
    
    func setupUI() {
        
        homecollectionview.backgroundColor = Colors.shared.blackcolor
        
        homecollectionview.register(UINib(nibName: "HeroCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HeroCollectionViewCell")
        homecollectionview.delegate = self
        homecollectionview.dataSource = self
    }

}
extension HomeView: UICollectionViewDelegate{
    
}

extension HomeView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = homecollectionview.dequeueReusableCell(withReuseIdentifier: "HeroCollectionViewCell", for: indexPath) as? HeroCollectionViewCell {
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}

extension HomeView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: homecollectionview.frame.width, height: 900)
    }
}
