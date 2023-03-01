//
//  HomeView.swift
//  NetflixApp
//
//  Created by Mac on 10/01/23.
//

import UIKit
enum HomeDataType {
    case home
    case category
    case mylist
}

protocol HomeViewDelegate {
    func tvShowsTapped()
    func moviesTapped()
    func HomeTapped()
    func tvShowsSubTappedTapped()
    func moviesSubTappedTapped()
    func tvShowsTappedEx()
    func moviesTappedEx()
    func mylistTappedEx()
    func goto_details_screen(banner: Banner?)
    func goto_playerScren(banner: Banner?)
    func goto_playscreen()
}

class HomeView: UIView {

    @IBOutlet weak var homecollectionview: UICollectionView!
    @IBOutlet weak var menuview: MenuView!
    
    var homedata : HomeData?
    
    var delegate: HomeViewDelegate?
    
    var subcategorydata: CategoryData?
    var isselected: Bool = false
    var homeDataType: HomeDataType = .home
    var myListData: [Banner] = []
    
    func setupUI() {
        
        menuview.delegate = self
        
        homecollectionview.backgroundColor = Colors.shared.blackcolor
       
        homecollectionview.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
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
    func update_category_Title(category: String, categorytype: categoryType) {
        if categorytype == .movies {
            menuview.updateMovieSubCategoryTitle(title: category)
        }else {
            menuview.updateTvShowsSubCategoryTitle(title: category)
        }
    }
    
    func update_Menuview_Layout(category: String) {
        if category == Strings.shared.home_cat {
            menuview.logoTapped()
        } else if category == Strings.shared.movies_cat {
            menuview.moviesTapped()
        } else if category == Strings.shared.mylist_cat {
            menuview.mylistTapped()
        } else if category == Strings.shared.tvshows_cat {
            menuview.tvshowsTapped()
        }
    }
}
extension HomeView: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if isselected {
                delegate?.goto_details_screen(banner: subcategorydata?.banner )
            }else {
                delegate?.goto_details_screen(banner: homedata?.banner?.first )
            }
        }else if isselected {
            delegate?.goto_details_screen(banner: subcategorydata?.playlists?[indexPath.row])
        }
    }
}

extension HomeView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else {
           if isselected {
                return subcategorydata?.playlists?.count ?? 0
            }else {
                return homedata?.playlists?.count ?? 0
            }
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            if let cell = homecollectionview.dequeueReusableCell(withReuseIdentifier: "HeroCollectionViewCell", for: indexPath) as? HeroCollectionViewCell {
                cell.delegate = self
                if isselected {
                    cell.configureUI(banner: subcategorydata?.banner)
                }else {
                    cell.configureUI(banner: homedata?.banner?.first)
                }
                
                return cell
            }
        } else {
            if isselected {
                if let cell = homecollectionview.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? ImageCollectionViewCell {
                    cell.configureUI(banner: subcategorydata?.playlists?[indexPath.row])
                    return cell
                }
            }else {
                if let cell = homecollectionview.dequeueReusableCell(withReuseIdentifier: "CarousalCollectionViewCell", for: indexPath) as? CarousalCollectionViewCell {
                    cell.delegate = self
                    cell.ConfigUI(playlist: homedata?.playlists?[indexPath.row])
                    return cell
                }
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
            if isselected {
                return CGSize(width: ((homecollectionview.frame.width)-30)/3, height: ((homecollectionview.frame.width)-30)/3)
            }else {
                return CGSize(width: homecollectionview.frame.width, height: Home_carousal_Height)
            }
        }
    }
}
extension HomeView: CarousalCollectionViewCellDelegate {
    func contentTapped(banner: Banner?) {
        delegate?.goto_details_screen(banner: banner)
    }
}

extension HomeView: MenuViewDelegate {
    func logoTapped() {
        delegate?.HomeTapped()
    }
    
    func tvShowsTapped() {
        delegate?.tvShowsTapped()
    }
    
    func moviesTapped() {
        delegate?.moviesTapped()
    }
    
    func mylistTapped() {
        
    }
    
    func tvShowsTappedEx() {
        delegate?.tvShowsTappedEx()
        
    }
    
    func moviesTappedEx() {
        delegate?.moviesTappedEx()
       
    }
    
    func mylistTappedEx() {
        delegate?.mylistTappedEx()
    }
    
    func tvShowsSubTappedTapped() {
        delegate?.tvShowsSubTappedTapped()
    }
    
    func moviesSubTappedTapped() {
        delegate?.moviesSubTappedTapped()
    }
    
    
}
extension HomeView: HeroCollectionViewCelldelegate {
    func playtapped() {
        if homeDataType == .category {
            delegate?.goto_playerScren(banner: subcategorydata?.banner )
        }else if homeDataType == .home {
            delegate?.goto_playerScren(banner: homedata?.banner?.first)
        }else {
            delegate?.goto_playerScren(banner: myListData.first)
            print("mylistTspped hello")
        }
    }
    
    
    func playtapped(banner: Banner?) {
       
    }
    
}


