//
//  SettingsViewController.swift
//  NetflixApp
//
//  Created by Mac on 30/01/23.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var settingsview: SettingsView!
    var settingsviewmodel: SettingsViewModel = SettingsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settingsview.setupUI()
        settingsview.settingData = settingsviewmodel.settingData
        settingsview.updateUI()
    }

}
