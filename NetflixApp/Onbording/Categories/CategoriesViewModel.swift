//
//  CategoriesViewModel.swift
//  NetflixApp
//
//  Created by Mac on 24/01/23.
//

import  UIKit
enum categoryType {
case movies
case tvshows
}

class CategoriesViewModel {
    var categorytype: categoryType = .tvshows
    var categoriesdata : [String] = AppData.shared.tvshowCategories ?? []
    
    func getData() {
        if categorytype == .tvshows {
            categoriesdata = AppData.shared.tvshowCategories ?? []
        }else {
            categoriesdata = AppData.shared.moviesCategories ?? []
        }
    }
}
