//
//  PlayerView.swift
//  NetflixApp
//
//  Created by Mac on 22/02/23.
//

import UIKit

class PlayerView: UIView {

    @IBOutlet weak var controlsview: UIView!
    @IBOutlet weak var closeview: UIView!
    @IBOutlet weak var closeimage: UIImageView!
    @IBOutlet weak var progressbar: UISlider!
    @IBOutlet weak var backwardimage: UIImageView!
    @IBOutlet weak var forwordimage: UIImageView!
    @IBOutlet weak var playPauseimage: UIImageView!
    @IBOutlet weak var currentTime: UILabel!
    @IBOutlet weak var totalDuration: UILabel!
    
    func setupUI() {
        backgroundColor = Colors.shared.blackcolor
        
        closeview.backgroundColor = Colors.shared.clearcolor
        closeimage.image = Images.shared.crossimage
        closeimage.tintColor = Colors.shared.whiteBgcolor
        closeview.layer.cornerRadius = 20.0
        
        backwardimage.image = Images.shared.tenSecondBackward
        backwardimage.tintColor = Colors.shared.whiteimagecolor
        forwordimage.image = Images.shared.tenSecondForward
        forwordimage.tintColor = Colors.shared.whiteimagecolor
        playPauseimage.image = Images.shared.playbutton
        playPauseimage.tintColor = Colors.shared.whiteimagecolor
        
        progressbar.tintColor = Colors.shared.redbuttoncolor
        progressbar.thumbTintColor = Colors.shared.redbuttoncolor
        progressbar.minimumTrackTintColor = Colors.shared.redbuttoncolor
        progressbar.maximumTrackTintColor = Colors.shared.blackcolor
        
        currentTime.textColor = Colors.shared.whiteTextcolor
        currentTime.font = Font.shared.medium3
        totalDuration.textColor = Colors.shared.whiteTextcolor
        totalDuration.font = Font.shared.medium3
        
        controlsview.isHidden = true
        addTapGester()
    }
    
    func addTapGester() {
        let tapGester = UITapGestureRecognizer(target: self, action: #selector(tapGesterRecognized(_:)))
        tapGester.numberOfTapsRequired = 1
        self.addGestureRecognizer(tapGester)
       
    }
    @objc func tapGesterRecognized(_ sender: UITapGestureRecognizer ) {
        
        controlsview.isHidden = !controlsview.isHidden
    }
}
