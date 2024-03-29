//
//  HomeViewController.swift
//  NetflixApp
//
//  Created by Mac on 10/01/23.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var homeview: HomeView!
    var homeviewmodel: HomeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeviewmodel.delegate = self
        homeview.delegate = self
        homeview.setupUI()
        homeview.homedata = homeviewmodel.homedata
        homeview.updateUI()
    }

    func Navigate_to_CategoriesVC() {
        DispatchQueue.main.async {
            if let controller = Controller.categories.getController() as? CategoriesViewController {
                controller.modalPresentationStyle = .overFullScreen
                controller.categoriesviewmodel.categorytype = .home
                controller.delegate = self
                self.present(controller, animated: true, completion: nil)
            }
        }
    }
}
extension HomeViewController: HomeViewDelegate {
    func HomeTapped() {
        homeviewmodel.getHomeData()
    }
    
    func tvShowsTapped() {
        homeviewmodel.getTvshowsData()
    }
    
    func moviesTapped() {
        homeviewmodel.getmoviesData()
    }
    func tvShowsSubTappedTapped() {
        DispatchQueue.main.async {
            if let controller = Controller.categories.getController() as? CategoriesViewController {
                controller.modalPresentationStyle = .overFullScreen
                controller.categoriesviewmodel.categorytype = .tvshows
                controller.delegate = self
                self.present(controller, animated: true, completion: nil)
            }
        }
    }
    
    func moviesSubTappedTapped() {
        DispatchQueue.main.async {
            if let controller = Controller.categories.getController() as? CategoriesViewController {
                controller.modalPresentationStyle = .overFullScreen
                controller.categoriesviewmodel.categorytype = .movies
                controller.delegate = self
                self.present(controller, animated: true, completion: nil)
            }
        }
    }
    func tvShowsTappedEx() {
        Navigate_to_CategoriesVC()
    }
    
    func moviesTappedEx() {
        Navigate_to_CategoriesVC()
    }
    
    func mylistTappedEx() {
        Navigate_to_CategoriesVC()
    }
    func goto_details_screen(banner: Banner?) {
        DispatchQueue.main.async {
          if let controller = Controller.details_screen.getController() as? DetailsViewController {
//            controller.modalPresentationStyle = .overFullScreen
            controller.detailsviewmodel.banner = banner
            self.navigationController?.pushViewController(controller, animated: true)
            }
          
        }
    }
//    func playTapped() {
//        DispatchQueue.main.async {
//          if let controller = Controller.playerscreen.getController() as? PlayerViewController {
//            controller.modalPresentationStyle = .overFullScreen
////            controller.detailsviewmodel.banner = banner
////            self.navigationController?.pushViewController(controller, animated: true)
//            }
//
//        }
//    }
    func goto_playerScren(banner: Banner?) {
        if banner?.contentType == .movie {
            DispatchQueue.main.async {
                if let controller = Controller.playerscreen.getController() as? PlayerViewController {
                    controller.playerviewmodel.banner = banner
                controller.modalPresentationStyle = .overFullScreen
                    self.present(controller, animated: true, completion: nil)
                }
              
            }
            
        }else {
            if let banner = banner {
                print("goto series details")
            }
        }
       
    }
    func goto_playscreen() {
        DispatchQueue.main.async {
          if let controller = Controller.playerscreen.getController() as? DetailsViewController {
            controller.modalPresentationStyle = .overFullScreen
           
//            self.navigationController?.pushViewController(controller, animated: true)
            }
          
        }
    }
}
extension HomeViewController: HomeViewModelDelegate {
  
    func updateUI() {
        homeview.homedata = homeviewmodel.homedata
        homeview.isselected = false
        homeview.updateUI()
    }
    
    func update_sub_categorydata() {
        homeview.subcategorydata = homeviewmodel.subcategorydata
        homeview.isselected = true
        homeview.updateUI()
    }
}
extension HomeViewController: CategoriesViewControllerDelegate {
    func categoryTapped(category: String, categorytype: categoryType) {
        if categorytype == .home {
            homeview.update_Menuview_Layout(category: category)
            homeviewmodel.updateHomeData(category: category)
        }else {
            homeview.update_category_Title(category: category, categorytype: categorytype)
            homeviewmodel.categoryTapped(category: category, categorytype: categorytype)
        
        }
    }
    
}
