//
//  AccountViewModel.swift
//  NetflixApp
//
//  Created by Mac on 30/01/23.
//

import UIKit

struct AccountSettings {
    var image: UIImage?
    var tittle: String?
}

class AccountViewModel {
    
    var profile : [Profile] {
        return User.shared.userdetails?.profiles ?? []
    }
    
    var accountsettings: [AccountSettings] = []
    
    init() {
        getData()
    }
    
    func getData() {
        accountsettings = []
        accountsettings.append(AccountSettings(image: Images.shared.bell, tittle: Strings.shared.notifications))
        accountsettings.append(AccountSettings(image: Images.shared.setting_unselect, tittle: Strings.shared.mylist_cat))
        accountsettings.append(AccountSettings(image: Images.shared.setting_unselect, tittle: Strings.shared.appSettings))
        accountsettings.append(AccountSettings(image: Images.shared.device, tittle: Strings.shared.devices))
        accountsettings.append(AccountSettings(image: Images.shared.question, tittle: Strings.shared.help))
    }
    
    func logOutUser() {
        User.shared.logout_user()
    }
}
