//
//  DetailsHeaderCollectionReusableView.swift
//  NetflixApp
//
//  Created by Mac on 11/02/23.
//

import UIKit

protocol DetailsHeaderCollectionReusableViewDelegate {
    func episodeTapped()
    func moreLikeThisTapped()
}

class DetailsHeaderCollectionReusableView: UICollectionReusableView {

    @IBOutlet weak var episodesViewWidth: NSLayoutConstraint!
    @IBOutlet weak var moreLikeThisViewWidth: NSLayoutConstraint!
    @IBOutlet weak var episodesView: UIView!
    @IBOutlet weak var episodeButton: UIButton!
    
    var delegate: DetailsHeaderCollectionReusableViewDelegate?
    var episodeTapped: Bool = true
    var isSeries: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configreUI(isSeries: Bool) {
        self.isSeries = isSeries
        
        if isSeries {
            if episodeTapped{
                episodesViewWidth.constant = 75
                moreLikeThisViewWidth.constant = 0
            }else {
                episodesViewWidth.constant = 0
                moreLikeThisViewWidth.constant = 115
            }
            episodeButton.isHidden = false
            episodesView.isHidden = false
        }else {
            moreLikeThisViewWidth.constant = 115
            episodeButton.isHidden = true
            episodesView.isHidden = true
            
            episodeTapped = false
        }
    }
    
    
    @IBAction func episodesTapped() {
        if !episodeTapped {
            self.episodeTapped = true
            delegate?.episodeTapped()
            episodesViewWidth.constant = 75
            moreLikeThisViewWidth.constant = 0
            
            UIView.animate(withDuration: 0.3) {
                self.layoutIfNeeded()
            } completion: { Bool in
//                self.episodeTapped = true
            }

        }
    }
    @IBAction func moreLikeThisTapped() {
        if episodeTapped {
            self.episodeTapped = false
            delegate?.moreLikeThisTapped()
            episodesViewWidth.constant = 0
            moreLikeThisViewWidth.constant = 115
            
            UIView.animate(withDuration: 0.3) {
                self.layoutIfNeeded()
            } completion: { Bool in
//                self.episodeTapped = false
            }

        }
    }
}
