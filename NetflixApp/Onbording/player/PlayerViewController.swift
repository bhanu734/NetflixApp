//
//  PlayerViewController.swift
//  NetflixApp
//
//  Created by Mac on 22/02/23.
//

import UIKit

class PlayerViewController: BaseViewController {

    @IBOutlet weak var playerview: PlayerView!
    var playerviewmodel: PlayerViewModel = PlayerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerview.delegate = self
        playerviewmodel.delegate = self
        playerview.setupUI()
        playerviewmodel.getVideoUrl()
    }
    
}

extension PlayerViewController: PlayerViewModelDelegate {
    func updateUI(videourl: String) {
        playerview.SetUpPlayer(videoUrl: videourl)
    }
}
extension PlayerViewController: PlayerViewDelegate {
    func closeTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    
}
