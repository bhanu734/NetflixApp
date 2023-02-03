//
//  AccountViewModel.swift
//  NetflixApp
//
//  Created by Mac on 30/01/23.
//

import UIKit

class AccountViewModel {
    
    var profile : [Profile] {
        return User.shared.userdetails?.profiles ?? []
    }
}
