//
//  ImageCollectionViewCell.swift
//  NetflixApp
//
//  Created by Mac on 20/12/22.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageview: UIImageView!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageview.layer.cornerRadius = 10.0
    }
    func configUI(imageName: String) {
        imageview.image = UIImage(named: imageName)
        imageview.backgroundColor = Colors.shared.darkgreycolor
    }
    
    func Profile_selection_configUI() {
        imageview.image = UIImage(systemName: "xmark.circle")
        imageview.backgroundColor = Colors.shared.darkgreycolor
    }
    func configureUI(banner: Banner?) {
        if let banner = banner {
            if let urlstring = banner.imagery?.thumbnailS {
                if let url = URL(string: urlstring + "&sz=200-h200") {
                    imageview.sd_setImage(with: url, placeholderImage: nil)
                }
            }
            
        }
    }
}
