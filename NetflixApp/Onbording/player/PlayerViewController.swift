//
//  PlayerViewController.swift
//  NetflixApp
//
//  Created by Mac on 22/02/23.
//

import UIKit

class PlayerViewController: UIViewController {

    @IBOutlet weak var playerview: PlayerView!
    var playerviewmodel: PlayerViewModel = PlayerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        playerview.setupUI()
    }
    
}
