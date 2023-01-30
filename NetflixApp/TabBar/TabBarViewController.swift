//
//  TabBarViewController.swift
//  NetflixApp
//
//  Created by Mac on 30/01/23.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

       setupTabBar()
       setupControllers()
    }
    
    func setupTabBar() {
        tabBar.tintColor = Colors.shared.blackcolor
        tabBar.unselectedItemTintColor = Colors.shared.darkgreycolor
        tabBar.backgroundColor = UIColor.blue.withAlphaComponent(0.8)
    }
    func setupControllers(){
        let HomeController = Controller.homeTab.getController()
        HomeController.tabBarItem = UITabBarItem(title: Strings.shared.Home, image: Images.shared.pluscircle, selectedImage: UIImage(systemName: "square.grid.2x2"))
        let SearchController = Controller.homeTab.getController()
        SearchController.tabBarItem = UITabBarItem(title: Strings.shared.Search, image: Images.shared.play, selectedImage: UIImage(systemName: "play.rectangle"))
        let AccountControlller =  Controller.homeTab.getController()
        AccountControlller.tabBarItem = UITabBarItem(title: Strings.shared.Account, image: UIImage(systemName: "map"), selectedImage: UIImage(systemName: "map"))
        let SettingsController = Controller.homeTab.getController()
        SettingsController.tabBarItem = UITabBarItem(title: Strings.shared.Settings, image: UIImage(systemName: "photo"), selectedImage: UIImage(systemName: "photo"))
        
        viewControllers = [HomeController, SearchController, AccountControlller, SettingsController]
    }

}
