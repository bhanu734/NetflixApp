//
//  UIView + Extension.swift
//  NetflixApp
//
//  Created by Mac on 10/12/22.
//

import UIKit

extension UIView {
    func addGradientStackBG(colors: [CGColor]) {
        let gradientlayer = CAGradientLayer()
        gradientlayer.frame = self.bounds
        
        gradientlayer.colors = colors
        gradientlayer.locations = [0.0, 1.0]
        
        gradientlayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientlayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        
        self.layer.addSublayer(gradientlayer)
    }
    func addGradientGetstartedBG(colors: [CGColor]) {
        let gradientlayer = CAGradientLayer()
        gradientlayer.frame = self.bounds
        
        gradientlayer.colors = colors
        gradientlayer.locations = [0.0, 1.0]
        
        gradientlayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientlayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        
        self.layer.addSublayer(gradientlayer)
    }
}
