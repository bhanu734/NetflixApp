//
//  SettingsViewModel.swift
//  NetflixApp
//
//  Created by Mac on 30/01/23.
//

import UIKit

struct Setting {
    var logoimage: UIImage?
    var title: String?
    var caption: String?
    var showArrow : Bool?
    var showSwitch: Bool?

}

class SettingsViewModel {
    var settingData: [Setting] = []
    
    init() {
        getData()
    }
    
    func getData() {
        settingData = []
        
        settingData.append(Setting(logoimage: Images.shared.wifi, title: Strings.shared.mobileDataUsage, caption: Strings.shared.automatic, showArrow: true, showSwitch: false))
        settingData.append(Setting(logoimage: Images.shared.wifi, title: Strings.shared.wifiOnly, caption: nil , showArrow: false, showSwitch: true))
        settingData.append(Setting(logoimage: Images.shared.downlaod, title: Strings.shared.smartDownloads, caption: Strings.shared.smartDownloadsCaption, showArrow: false, showSwitch: true))
        settingData.append(Setting(logoimage: Images.shared.videoQuality, title: Strings.shared.videoQuality, caption: Strings.shared.standard, showArrow: true, showSwitch: false))
        
        settingData.append(Setting(logoimage: Images.shared.delete, title: Strings.shared.deleteAllDownloads, caption: nil, showArrow: true, showSwitch: false))
        settingData.append(Setting(logoimage: Images.shared.speed, title: Strings.shared.internetSpeedTest, caption: nil, showArrow: true, showSwitch: false))
        settingData.append(Setting(logoimage: Images.shared.privacy, title: Strings.shared.privacyPolicy, caption: nil, showArrow: true, showSwitch: false))
    }
}
