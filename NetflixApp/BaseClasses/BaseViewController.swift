//
//  BaseViewController.swift
//  NetflixApp
//
//  Created by Mac on 19/12/22.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
            let alertcontroller = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okaction = UIAlertAction(title: "ok", style: .default)
            alertcontroller.addAction(okaction)
            self.present(alertcontroller, animated: true)
        }
        
    }

}
