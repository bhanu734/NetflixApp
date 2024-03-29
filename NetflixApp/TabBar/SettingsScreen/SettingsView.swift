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
    
    var settingData: [[Setting]] = []
    var settingHeader: [String] = []
    
    func setupUI() {
        
        backgroundColor = Colors.shared.blackcolor
        
        SettingLable.text = Strings.shared.appSettings
        SettingLable.textColor = Colors.shared.whiteTextcolor
        SettingLable.font = Font.shared.semibold4
        
        settingsTableview.backgroundColor = Colors.shared.blackcolor
        
        settingsTableview.register(UINib(nibName: "SettingTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingTableViewCell")
        settingsTableview.register(UINib(nibName: "HeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "HeaderTableViewCell")
        settingsTableview.delegate = self
        settingsTableview.dataSource = self
    }
    
    func updateUI() {
        settingsTableview.reloadData()
    }
}

extension SettingsView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
}
extension SettingsView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingData.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = settingsTableview.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as? SettingTableViewCell {
            cell.configureUI(Data: settingData[indexPath.section][indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let header = settingsTableview.dequeueReusableCell(withIdentifier: "HeaderTableViewCell") as? HeaderTableViewCell {
            header.configUI(text: settingHeader[section] )
            return header
        }
        return nil
    }
}
