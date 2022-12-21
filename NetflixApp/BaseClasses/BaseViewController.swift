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
    func showAlert(title: String, message: String, completion: @escaping (() -> ())) {
        DispatchQueue.main.async {
            let alertcontroller = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okaction = UIAlertAction(title: "ok", style: .default) {action in
                completion()
            }
            alertcontroller.addAction(okaction)
            self.present(alertcontroller, animated: true)
        }
        
    }

}
