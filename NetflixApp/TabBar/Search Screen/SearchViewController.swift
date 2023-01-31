//
//  SearchViewController.swift
//  NetflixApp
//
//  Created by Mac on 29/01/23.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchview: SearchView!
    var searchviewmodel: SearchViewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchview.setupUI()
        
    }
 
}
