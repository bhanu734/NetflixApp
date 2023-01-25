//
//  SplashView.swift
//  NetflixApp
//
//  Created by Mac on 23/12/22.
//

import UIKit

protocol SplashViewDelegate {
    func goto_Welcome_Screen()
    func animation_Completed()
   
}

class SplashView: UIView {

    @IBOutlet weak var NetflixGifimage: UIImageView!
    @IBOutlet weak var gifwidth: NSLayoutConstraint!
    @IBOutlet weak var gifleading: NSLayoutConstraint!
    
    var delegate: SplashViewDelegate?
    
    
    
    func setupUI() {
//        NetflixGifimage.image = UIImage.gifImageWithName("netflixGif")
        NetflixGifimage.image = UIImage.sd_image(withGIFData: sd_imageLoadOperation(forKey: "netflixGif") as? Data)
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
            DispatchQueue.main.asyncAfter(deadline: .now()+0.2) {
                self.delegate?.animation_Completed()
            }
        
        }

    }
    
}
