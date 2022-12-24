//
//  SplashView.swift
//  NetflixApp
//
//  Created by Mac on 23/12/22.
//

import UIKit

class SplashView: UIView {

    @IBOutlet weak var NetflixGifimage: UIImageView!
    @IBOutlet weak var gifwidth: NSLayoutConstraint!
    @IBOutlet weak var gifleading: NSLayoutConstraint!
    
    func setupUI() {
        NetflixGifimage.image = UIImage.gifImageWithName("netflixGif")
        backgroundColor = Colors.shared.blackcolor
        
        gifwidth.constant = UIScreen.main.bounds.width - 120
        gifleading.constant = UIScreen.main.bounds.width - 120
    }

    func animateGifimage() {
        gifleading.constant = 60
        UIView.animate(withDuration: 1.2) {
            self.layoutSubviews()
        } completion: { Bool in
            self.NetflixGifimage.image = Images.shared.netfliximage
        }

    }
}
