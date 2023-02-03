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
        accountview.setupUI()
        accountview.profiles = accountviewmodel.profile
        accountview.updateUI()
    }

}
extension AccountViewController: AccountViewDelegate {
    func closedTapped() {
        dismiss(animated: true, completion: nil)
    }
}
