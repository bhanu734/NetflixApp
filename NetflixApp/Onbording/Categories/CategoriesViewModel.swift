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
case home
}

class CategoriesViewModel {
    var categorytype: categoryType = .tvshows
    var categoriesdata : [String] = AppData.shared.tvshowCategories ?? []
    
    
    func getData() {
        if categorytype == .tvshows {
            categoriesdata = AppData.shared.tvshowCategories ?? []
        }else if categorytype == .movies {
            categoriesdata = AppData.shared.moviesCategories ?? []
        } else {
            categoriesdata = [Strings.shared.home_cat , Strings.shared.movies_cat , Strings.shared.mylist_cat , Strings.shared.tvshows_cat ] 
        }
    }
}
