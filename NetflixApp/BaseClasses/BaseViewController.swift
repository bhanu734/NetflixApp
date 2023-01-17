//
//  BaseViewController.swift
//  NetflixApp
//
//  Created by Mac on 19/12/22.
//

import UIKit

class BaseViewController: UIViewController {
    let loader: Loader = Loader.init(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loader.frame = self.view.frame
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

    func showLoader() {
        DispatchQueue.main.async {
            guard let window = UIApplication.shared.windows.last else { return }
            
            if (window.subviews.contains(self.loader)) {
                window.bringSubviewToFront(self.loader)
            }else{
                window.addSubview(self.loader)
                window.bringSubviewToFront(self.loader)
            }
            self.loader.startAnimation()
        }
    }
    
    func hideLoader() {
        DispatchQueue.main.async {
            self.loader.stopAnimating()
            self.loader.removeFromSuperview()
        }
    }
}
