//
//  DetailsHeaderCollectionReusableView.swift
//  NetflixApp
//
//  Created by Mac on 11/02/23.
//

import UIKit

class DetailsHeaderCollectionReusableView: UICollectionReusableView {

    @IBOutlet weak var episodesViewWidth: NSLayoutConstraint!
    @IBOutlet weak var moreLikeThisViewWidth: NSLayoutConstraint!
    @IBOutlet weak var episodesView: UIView!
    @IBOutlet weak var episodeButton: UIButton!
    
    var episodeTapped: Bool = false
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
            episodesViewWidth.constant = 75
            moreLikeThisViewWidth.constant = 0
            
            episodeButton.isHidden = false
            episodesView.isHidden = false
        }else {
            episodeButton.isHidden = true
            episodesView.isHidden = true
        }
    }
    
    
    @IBAction func episodesTapped() {
        if !episodeTapped {
            episodesViewWidth.constant = 75
            moreLikeThisViewWidth.constant = 0
            
            UIView.animate(withDuration: 0.2) {
                self.layoutIfNeeded()
            } completion: { Bool in
                self.episodeTapped = true
            }

        }
    }
    @IBAction func moreLikeThisTapped() {
        if episodeTapped {
            episodesViewWidth.constant = 0
            moreLikeThisViewWidth.constant = 115
            
            UIView.animate(withDuration: 0.2) {
                self.layoutIfNeeded()
            } completion: { Bool in
                self.episodeTapped = false
            }

        }
    }
}
