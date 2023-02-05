//
//  SettingsView.swift
//  NetflixApp
//
//  Created by Mac on 30/01/23.
//

import UIKit

class SettingsView: UIView {

    @IBOutlet weak var SettingLable: UILabel!
    @IBOutlet weak var settingsTableview: UITableView!
    
    func setupUI() {
        
        backgroundColor = Colors.shared.blackcolor
        
        SettingLable.text = Strings.shared.Account
        SettingLable.textColor = Colors.shared.whiteTextcolor
        SettingLable.font = Font.shared.semibold4
        
        settingsTableview.backgroundColor = Colors.shared.blackcolor
        
        settingsTableview.register(UINib(nibName: "SettingTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingTableViewCell")
        settingsTableview.delegate = self
        settingsTableview.dataSource = self
    }
    
    func updateUI() {
        settingsTableview.reloadData()
    }
}
extension SettingsView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
extension SettingsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
