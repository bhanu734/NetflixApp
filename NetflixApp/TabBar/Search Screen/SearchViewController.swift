//
//  SearchViewController.swift
//  NetflixApp
//
//  Created by Mac on 29/01/23.
//

import UIKit

class SearchViewController: BaseViewController {

    @IBOutlet weak var searchview: SearchView!
    var searchviewmodel: SearchViewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchviewmodel.delegate = self
        searchview.setupUI()
        
        searchviewmodel.get_search_inital_data()
        searchview.updateUI()
    }
 
}
extension SearchViewController: SearchViewModelDelegate {
    func updateUI() {
        searchview.searchData = searchviewmodel.search_inital
        searchview.updateUI()
    }
    
    
    
}
