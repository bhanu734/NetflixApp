//
//  HomeView.swift
//  NetflixApp
//
//  Created by Mac on 10/01/23.
//

import UIKit

class HomeView: UIView {

    @IBOutlet weak var homecollectionview: UICollectionView!
    var homedata : HomeData?
    
    func setupUI() {
        
        homecollectionview.backgroundColor = Colors.shared.blackcolor
       
        homecollectionview.register(UINib(nibName: "HeroCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HeroCollectionViewCell")
        homecollectionview.register(UINib(nibName: "CarousalCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CarousalCollectionViewCell")
        homecollectionview.delegate = self
        homecollectionview.dataSource = self
    }

    func updateUI() {
        DispatchQueue.main.async {
            self.homecollectionview.reloadData()
        }
    }
}
extension HomeView: UICollectionViewDelegate{
    
}

extension HomeView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else {
            return homedata?.playlists?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            if let cell = homecollectionview.dequeueReusableCell(withReuseIdentifier: "HeroCollectionViewCell", for: indexPath) as? HeroCollectionViewCell {
                cell.configureUI(banner: homedata?.banner?.first)
                return cell
            }
        } else {
            if let cell = homecollectionview.dequeueReusableCell(withReuseIdentifier: "CarousalCollectionViewCell", for: indexPath) as? CarousalCollectionViewCell {
                cell.ConfigUI(playlist: homedata?.playlists?[indexPath.row
                ])
                return cell
            }
        }
        return UICollectionViewCell()
    }
    
    
}

extension HomeView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0{
            return CGSize(width: homecollectionview.frame.width, height: Home_banner_Height)
        }else {
            return CGSize(width: homecollectionview.frame.width, height: Home_carousal_Height)
        }
        
    }
}
