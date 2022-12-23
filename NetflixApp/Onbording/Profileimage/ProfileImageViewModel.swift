//
//  ProfileImageViewModel.swift
//  NetflixApp
//
//  Created by Mac on 20/12/22.
//

import UIKit

class ProfileImageViewModel {
    var images : [String] = []
    
    func getImages() {
        images = []
        
        for i in 1...56 {
            images.append("profile" + String(i))
        }
    }
}
