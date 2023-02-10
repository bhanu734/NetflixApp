//
//  DetailsView.swift
//  NetflixApp
//
//  Created by Mac on 06/02/23.
//

import UIKit

protocol DetailsViewDelegate {
    func cloeTapped()
}

class DetailsView: UIView {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var closeview: UIView!
    @IBOutlet weak var closeimage: UIImageView!
    
    var delegate: DetailsViewDelegate?
    var banner: Banner?
    var movieDetails: MoviesData?
    var seriesDetails: SeriesData?
    
    var isSeries: Bool {
        return (seriesDetails != nil)
    }
    
    func setupUI() {
        backgroundColor = Colors.shared.blackcolor
        collectionView.backgroundColor = Colors.shared.blackcolor
        
        closeview.backgroundColor = Colors.shared.darkgreycolor
        closeimage.image = Images.shared.xmark
        closeimage.tintColor = Colors.shared.whiteimagecolor
        closeview.layer.cornerRadius = 15.0
        
        collectionView.register(UINib(nibName: "DetailheroCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DetailheroCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    func updateUI() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
     
    }
    @IBAction func closeTap() {
        delegate?.cloeTapped()
    }
}

extension DetailsView: UICollectionViewDelegate {
    
}
extension DetailsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailheroCollectionViewCell", for: indexPath) as? DetailheroCollectionViewCell {
            if isSeries {
                cell.configUI(detailsData: seriesDetails)
            }else {
                cell.configUI(detailsData: movieDetails)
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}
extension DetailsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: SCREENWIDTH , height: 700)
    }
}
