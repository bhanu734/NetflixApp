//
//  AppData.swift
//  NetflixApp
//
//  Created by Mac on 28/12/22.
//

import UIKit

class AppData {
    
   static let shared: AppData = AppData()
    
    var homeData: HomeData?
    var tvshowCategories: [String]?
    var moviesCategories: [String]?
}
