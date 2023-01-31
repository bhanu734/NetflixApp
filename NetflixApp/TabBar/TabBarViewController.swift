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
        tabBar.tintColor = Colors.shared.whiteTextcolor
        tabBar.unselectedItemTintColor = Colors.shared.grey_tabBar_color
        
        UITabBar.appearance().barTintColor = Colors.shared.blackcolor
    }
    func setupControllers(){
        let HomeController = Controller.homeTab.getController()
        HomeController.tabBarItem = UITabBarItem(title: Strings.shared.Home, image: Images.shared.home_unselect, selectedImage: Images.shared.home_select)
        let SearchController = Controller.search.getController()
        SearchController.tabBarItem = UITabBarItem(title: Strings.shared.Search, image: Images.shared.search_unselect, selectedImage: Images.shared.search_select)
        let AccountControlller =  Controller.Account.getController()
        AccountControlller.tabBarItem = UITabBarItem(title: Strings.shared.Account, image: Images.shared.account_unselect, selectedImage: Images.shared.account_select)
        let SettingsController = Controller.settings.getController()
        SettingsController.tabBarItem = UITabBarItem(title: Strings.shared.Settings, image: Images.shared.setting_unselect, selectedImage: Images.shared.setting_select)
        
        viewControllers = [HomeController, SearchController, AccountControlller, SettingsController]
    }

}
