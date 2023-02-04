//
//  AccountViewController.swift
//  NetflixApp
//
//  Created by Mac on 30/01/23.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var accountview: AccountView!
    var accountviewmodel: AccountViewModel = AccountViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        accountview.delegate = self
        accountview.profiles = accountviewmodel.profile
        accountview.accountsettings = accountviewmodel.accountsettings
        accountview.versionNumber = accountviewmodel.AppVersionNumber ?? ""
        accountview.buildNumber = accountviewmodel.AppbuildNumber ?? ""
        accountview.setupUI()
        accountview.updateUI()
    }

}
extension AccountViewController: AccountViewDelegate {
    func closedTapped() {
        let controller = Controller.homeTab.getController()
        navigationController?.pushViewController(controller, animated: true)
    }
    func sigoutTapped() {
        accountviewmodel.logOutUser()
        let controller = Controller.welcome.getController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
