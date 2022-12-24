//
//  ProfileSelectionViewModel.swift
//  NetflixApp
//
//  Created by Mac on 22/12/22.
//

import UIKit

class ProfileSelectionViewModel {
    
    var  profiles : [Profile] {
        return User.shared.userdetails?.profiles ?? []
    }
}
