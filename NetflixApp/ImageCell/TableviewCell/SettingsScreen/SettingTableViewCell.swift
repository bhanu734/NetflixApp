//
//  SettingTableViewCell.swift
//  NetflixApp
//
//  Created by Mac on 05/02/23.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    @IBOutlet weak var topview: UIView!
    @IBOutlet weak var stackview: UIStackView!
    @IBOutlet weak var logoimage: UIImageView!
    @IBOutlet weak var arrowimage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var switchoutlet: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        setupUI()
    }
 
    func setupUI() {
        topview.backgroundColor = Colors.shared.darkgreycolor
        
        stackview.backgroundColor = Colors.shared.darkgreycolor
        
        logoimage.tintColor = Colors.shared.lightgreycolor
        
        arrowimage.tintColor = Colors.shared.lightgreycolor
        arrowimage.image = Images.shared.chevronRight
        
        titleLabel.textColor = Colors.shared.whiteTextcolor
        captionLabel.textColor = Colors.shared.lightgreycolor
    }
    func configureUI(Data: Setting) {
        logoimage.image = Data.logoimage
        titleLabel.text = Data.title
        
        if let captiontext = Data.caption {
            captionLabel.text = captiontext
            captionLabel.isHidden = false
        }else {
            captionLabel.isHidden = true
        }
        
        arrowimage.isHidden = !(Data.showArrow ?? false)
        switchoutlet.isHidden = !(Data.showSwitch ?? false)
    }
}
