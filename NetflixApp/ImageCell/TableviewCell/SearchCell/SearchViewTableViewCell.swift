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
       
        backview.backgroundColor = Colors.shared.blackcolor
        
        searchlabel.textColor = Colors.shared.whiteTextcolor
        searchlabel.font = Font.shared.semibold2
        
        playview.backgroundColor = Colors.shared.blackcolor
        playimage.tintColor = Colors.shared.whiteimagecolor
        playimage.image = Images.shared.playcircle
        searchimage.layer.cornerRadius = 10.0
        searchimage.layer.masksToBounds = false
    }
    func configureUI(banner: Banner?) {
        searchlabel.text = banner?.getTitle()
        if let banner = banner {
            if let urlstring = banner.imagery?.banner {
                if let url = URL(string: urlstring + "&sz=w175-h100") {
                    searchimage.sd_setImage(with: url, placeholderImage: nil)
                }
            }
            
        }
        
    }
}
