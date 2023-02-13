//
//  EpisodeCollectionViewCell.swift
//  NetflixApp
//
//  Created by Mac on 12/02/23.
//

import UIKit

class EpisodeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var topview: UIView!
    @IBOutlet weak var episodeimage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var downloadimage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpUI()
    }

    func setUpUI() {
        topview.backgroundColor = Colors.shared.blackcolor
        
        titleLabel.textColor = Colors.shared.whiteTextcolor
        
        descriptionLabel.textColor = Colors.shared.whiteTextcolor
        
        downloadimage.image = Images.shared.download_details
        downloadimage.tintColor = Colors.shared.whiteimagecolor
    }
    
    func configureUI(episode: Episode? , imagery: Imagery?) {
        if let episode = episode {
            
            titleLabel.text = episode.name
            descriptionLabel.text = episode.overview
            
        }
        if let banner = imagery?.banner , let url = URL(string: banner + "&sz=w200-h112" ) {
            episodeimage.sd_setImage(with: url, placeholderImage: nil )
        }
    }
}
