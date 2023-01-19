//
//  HeroCollectionViewCell.swift
//  NetflixApp
//
//  Created by Mac on 18/01/23.
//

import UIKit

class HeroCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var heroimageview: UIImageView!
    @IBOutlet weak var herostackview: UIStackView!
    @IBOutlet weak var mylistview: UIView!
    @IBOutlet weak var mylistimageview: UIImageView!
    @IBOutlet weak var mylistlabel: UILabel!
    @IBOutlet weak var Playview: UIView!
    @IBOutlet weak var playimageview: UIImageView!
    @IBOutlet weak var playlabel: UILabel!
    @IBOutlet weak var infoview: UIView!
    @IBOutlet weak var infoimageview: UIImageView!
    @IBOutlet weak var infolabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }

    func setupUI() {
        heroimageview.image = Images.shared.welcomeBG
        heroimageview.contentMode = .scaleAspectFill
        
        herostackview.backgroundColor = Colors.shared.blackcolor
        
        mylistimageview.image = Images.shared.plus
        mylistimageview.tintColor = Colors.shared.whiteimagecolor
        mylistview.backgroundColor = Colors.shared.blackcolor
        mylistlabel.text = Strings.shared.mylistlabel
        mylistlabel.textColor = Colors.shared.whiteTextcolor
        
        playimageview.image = Images.shared.play
        playimageview.tintColor = Colors.shared.whiteimagecolor
        Playview.backgroundColor = Colors.shared.blackcolor
        playlabel.text = Strings.shared.play
        playlabel.textColor = Colors.shared.whiteTextcolor
        
        infoimageview.image = Images.shared.info
        infoimageview.tintColor = Colors.shared.whiteimagecolor
        infoview.backgroundColor = Colors.shared.blackcolor
        infolabel.text = Strings.shared.info
        infolabel.textColor = Colors.shared.whiteTextcolor
    }
}
