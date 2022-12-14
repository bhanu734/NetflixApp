//
//  Colors.swift
//  NetflixApp
//
//  Created by Mac on 09/12/22.
//

import UIKit

class Colors {
    static let shared: Colors = Colors()
    
    let whiteTextcolor = UIColor.white
    let redbuttoncolor = UIColor.red
    let blackgradient = UIColor.black.cgColor
    let lightgreycolor = UIColor.lightGray
    let semilightgrey3 = UIColor.systemGray3
    let darkgreycolor = UIColor.darkGray
    let blackcolor = UIColor.black
    let blackgradient_alphaZero = UIColor.black.withAlphaComponent(0).cgColor
    let blackgradient_alphaZero_half = UIColor.black.withAlphaComponent(0.8).cgColor
    let redbordercolor = UIColor.red.withAlphaComponent(1).cgColor
}
