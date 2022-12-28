//
//  WelcomeView.swift
//  NetflixApp
//
//  Created by Mac on 09/12/22.
//

import UIKit

protocol WelcomeViewDelegate {
    func signinTapped()
    func getstartedTapped()
    func privacyTapped()
}

class WelcomeView: UIView {
    
    @IBOutlet weak var backgroundimage: UIImageView!
    @IBOutlet weak var privacybutton: UIButton!
    @IBOutlet weak var signinbutton: UIButton!
    @IBOutlet weak var getstartedbutton: UIButton!
    @IBOutlet weak var stackBG: UIView!
    @IBOutlet weak var getstartedBG: UIView!
    
    var delegate: WelcomeViewDelegate?
    
    func setupUI() {
        backgroundimage.image = Images.shared.welcomeBG
        backgroundimage.contentMode = .scaleAspectFill
        
        privacybutton.titleLabel?.font = Font.shared.heavy1_1
        privacybutton.setTitleColor(Colors.shared.whiteTextcolor, for: .normal)
        privacybutton.setTitle(Strings.shared.privacy, for: .normal)
        
        signinbutton.titleLabel?.font = Font.shared.heavy1_1
        signinbutton.setTitleColor(Colors.shared.whiteTextcolor, for: .normal)
        signinbutton.setTitle(Strings.shared.signin, for: .normal)
        
        getstartedbutton.titleLabel?.font = Font.shared.semibold2
        getstartedbutton.setTitleColor(Colors.shared.whiteTextcolor, for: .normal)
        getstartedbutton.backgroundColor = Colors.shared.redbuttoncolor
        getstartedbutton.setTitle(Strings.shared.getstarted, for: .normal)
        getstartedbutton.layer.cornerRadius = 2.0
        
        stackBG.addGradientStackBG(colors: [Colors.shared.blackgradient_alphaZero_half, Colors.shared.blackgradient_alphaZero])
        getstartedBG.addGradientGetstartedBG(colors: [Colors.shared.blackgradient, Colors.shared.blackgradient_alphaZero])
        
    }
    @IBAction func privacyTapped() {
        delegate?.privacyTapped()
    }
    @IBAction func signinTapped() {
        delegate?.signinTapped()
    }
    @IBAction func getstartedTapped() {
        delegate?.getstartedTapped()
    }
}
