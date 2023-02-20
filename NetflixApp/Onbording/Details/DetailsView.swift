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
    var ismoreLikeThis: Bool = false
    var relatedContent: [Banner] = []
    
    var isSeries: Bool = false
    
    func setupUI() {
        backgroundColor = Colors.shared.blackcolor
        collectionView.backgroundColor = Colors.shared.blackcolor
        
        closeview.backgroundColor = Colors.shared.darkgreycolor
        closeimage.image = Images.shared.xmark
        closeimage.tintColor = Colors.shared.whiteimagecolor
        closeview.layer.cornerRadius = 15.0
        
        collectionView.register(UINib(nibName: "DetailheroCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DetailheroCollectionViewCell")
        collectionView.register(UINib(nibName: "DetailsHeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "DetailsHeaderCollectionReusableView")
        collectionView.register(UINib(nibName: "EpisodeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "EpisodeCollectionViewCell")
        collectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        
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
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1 {
            if isSeries {
                if !ismoreLikeThis {
                    return seriesDetails?.seasons?.first?.episodes?.count ?? 0
                }
                
            }
            return relatedContent.count
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailheroCollectionViewCell", for: indexPath) as? DetailheroCollectionViewCell {
                if isSeries {
                    cell.configUI(detailsData: seriesDetails)
                }else {
                    cell.configUI(detailsData: movieDetails)
                }
                return cell
            }
        }else if indexPath.section == 1 {
            if isSeries {
                if !ismoreLikeThis {
                    if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EpisodeCollectionViewCell", for: indexPath) as? EpisodeCollectionViewCell {
                        cell.configureUI(episode: seriesDetails?.seasons?.first?.episodes?[indexPath.row], imagery: seriesDetails?.imagery)
                        return cell
                    }
                }
                
            }
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? ImageCollectionViewCell {
                cell.configureUI(banner: relatedContent[indexPath.row])
                return cell
            }
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader , indexPath.section == 1 {
            if let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "DetailsHeaderCollectionReusableView", for: indexPath) as? DetailsHeaderCollectionReusableView {
                header.delegate = self
                header.configreUI(isSeries: isSeries)
                return header
            }
            
        }
        return UICollectionReusableView()
    }
}
extension DetailsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: SCREENWIDTH , height: 750)
        }else if indexPath.section == 1 {
            if isSeries {
                if !ismoreLikeThis {
                    return CGSize(width: collectionView.frame.width , height: 140)
                }
            }
            return CGSize(width: (collectionView.frame.width)/3-10 , height: (collectionView.frame.width)/3-10)
        }
        return CGSize.zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return CGSize(width: collectionView.frame.width, height: 50)
        }
            return CGSize.zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
            return CGSize.zero
    }
}
extension DetailsView: DetailsHeaderCollectionReusableViewDelegate {
    func episodeTapped() {
        ismoreLikeThis = false
        updateUI()
    }
    func moreLikeThisTapped() {
        ismoreLikeThis = true
        updateUI()
    }
}
