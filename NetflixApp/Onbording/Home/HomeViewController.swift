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
        print("home: ", category)
        homeviewmodel.categoryTapped(category: category, categorytype: categorytype)
    }
    
}
