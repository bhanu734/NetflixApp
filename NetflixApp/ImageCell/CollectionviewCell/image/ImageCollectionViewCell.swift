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
}
