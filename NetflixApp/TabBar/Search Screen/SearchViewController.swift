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
        
        searchview.delegate = self
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
    func updateSearchresult() {
        searchview.searchData = searchviewmodel.searchresult
        searchview.updateUI()
    }
}
extension SearchViewController: SearchViewDelegate {
    func getsearchlist(querystring: String) {
        searchviewmodel.getsearchlist(querystring: querystring)
    }
    func getinitaldata() {
        updateUI()
    }
}
