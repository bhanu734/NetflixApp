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
    var settingData: [[Setting]] = []
    var settingHeader: [String] = []
    
    init() {
        getData()
    }
    
    func getData() {
        settingData = []
        
        var dataforsection1: [Setting] = []
        dataforsection1.append(Setting(logoimage: Images.shared.wifi, title: Strings.shared.mobileDataUsage, caption: Strings.shared.automatic, showArrow: true, showSwitch: false))
        
        var dataforsection2: [Setting] = []
        dataforsection2.append(Setting(logoimage: Images.shared.wifi, title: Strings.shared.wifiOnly, caption: nil , showArrow: false, showSwitch: true))
        dataforsection2.append(Setting(logoimage: Images.shared.downlaod, title: Strings.shared.smartDownloads, caption: Strings.shared.smartDownloadsCaption, showArrow: false, showSwitch: true))
        dataforsection2.append(Setting(logoimage: Images.shared.videoQuality, title: Strings.shared.videoQuality, caption: Strings.shared.standard, showArrow: true, showSwitch: false))
        dataforsection2.append(Setting(logoimage: Images.shared.delete, title: Strings.shared.deleteAllDownloads, caption: nil, showArrow: true, showSwitch: false))
        
        var dataforsection3: [Setting] = []
       dataforsection3.append(Setting(logoimage: Images.shared.speed, title: Strings.shared.internetSpeedTest, caption: nil, showArrow: true, showSwitch: false))
        dataforsection3.append(Setting(logoimage: Images.shared.bell , title: Strings.shared.privacyPolicy, caption: nil, showArrow: true, showSwitch: false))
        
        settingData.append(dataforsection1)
        settingData.append(dataforsection2)
        settingData.append(dataforsection3)
        
        settingHeader = []
        settingHeader.append(Strings.shared.videoPlayback)
        settingHeader.append(Strings.shared.downloads)
        settingHeader.append(Strings.shared.about)
    }
}
