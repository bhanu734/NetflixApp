//
//  CarousalCollectionViewCell.swift
//  NetflixApp
//
//  Created by Mac on 19/01/23.
//

import UIKit
import  SDWebImage

protocol CarousalCollectionViewCellDelegate {
    func contentTapped(banner: Banner?)
}

class CarousalCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var caurosaltitle: UILabel!
    @IBOutlet weak var carousalcollectionview: UICollectionView!
    
    var delegate: CarousalCollectionViewCellDelegate?
    var playlistdata: Playlist?
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        caurosaltitle.textColor = Colors.shared.whiteTextcolor
        carousalcollectionview.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        carousalcollectionview.delegate = self
        carousalcollectionview.dataSource = self
    }

    func ConfigUI(playlist: Playlist?) {
        if let playlist = playlist{
            self.playlistdata = playlist
            caurosaltitle.text = playlist.title
            caurosaltitle.font = Font.shared.bold4
            DispatchQueue.main.async {
                self.carousalcollectionview.reloadData()
            }
           
        }
    }
}
extension CarousalCollectionViewCell: UICollectionViewDataSource { 

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playlistdata?.content?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = carousalcollectionview.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? ImageCollectionViewCell {
            cell.configureUI(banner: playlistdata?.content?[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}

extension CarousalCollectionViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.contentTapped(banner: playlistdata?.content?[indexPath.row])
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

extension CarousalCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Home_Tile_Width, height: Home_tile_Height)
    }
}
