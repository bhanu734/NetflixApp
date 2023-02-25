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
        
        playerviewmodel.delegate = self
        playerview.setupUI()
    }
    
}

extension PlayerViewController: PlayerViewModelDelegate {
    
}
