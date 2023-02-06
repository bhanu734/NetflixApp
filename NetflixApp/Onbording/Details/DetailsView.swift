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
    
    func setupUI() {
        collectionView.backgroundColor = Colors.shared.blackcolor
        
        closeview.backgroundColor = Colors.shared.darkgreycolor
        closeimage.image = Images.shared.xmark
        closeimage.tintColor = Colors.shared.whiteimagecolor
        closeview.layer.cornerRadius = 20.0
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    func updateUI() {
        self.collectionView.reloadData()
    }
    @IBAction func closeTap() {
        delegate?.cloeTapped()
    }
}

extension DetailsView: UICollectionViewDelegate {
    
}
extension DetailsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return UICollectionViewCell()
    }
    
    
}
extension DetailsView: UICollectionViewDelegateFlowLayout {
    
}
