//
//  SearchViewTableViewCell.swift
//  NetflixApp
//
//  Created by Mac on 31/01/23.
//

import UIKit

class SearchViewTableViewCell: UITableViewCell {

    @IBOutlet weak var searchimage: UIImageView!
    @IBOutlet weak var searchlabel: UILabel!
    @IBOutlet weak var playimage: UIImageView!
    @IBOutlet weak var playview: UIView!
    @IBOutlet weak var backview: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    func setupUI() {
        searchimage.layer.cornerRadius = 10.0
        backview.backgroundColor = Colors.shared.blackcolor
        
        searchlabel.textColor = Colors.shared.whiteTextcolor
        searchlabel.font = Font.shared.semibold2
        
        playview.backgroundColor = Colors.shared.blackcolor
        playimage.tintColor = Colors.shared.whiteimagecolor
        playimage.image = Images.shared.playcircle
        
    }
    func configureUI(banner: Banner?) {
        searchlabel.text = banner?.originalTitle
        if let banner = banner {
            if let urlstring = banner.imagery?.banner {
                if let url = URL(string: urlstring + "&sz=300-h200") {
                    searchimage.sd_setImage(with: url, placeholderImage: nil)
                }
            }
            
        }
        
    }
}
