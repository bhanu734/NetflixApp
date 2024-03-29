//
//  SearchViewModel.swift
//  NetflixApp
//
//  Created by Mac on 29/01/23.
//

import UIKit
protocol SearchViewModelDelegate {
    func showLoader()
    func hideLoader()
    func updateUI()
    func updateSearchresult()
}
class SearchViewModel {
    
    var delegate: SearchViewModelDelegate?
    var search_inital: [Banner]?
    var searchresult: [Banner]?
    
    func get_search_inital_data() {
        
        self.delegate?.showLoader()
        let urlString = Url.search_initial.getUrl()
      
        var headers: [String: String] = ["Content-Type": "application/json"]
        headers["Authorization"] = "cf606825b8a045c1aae39f7fe39de6c6"
        
        NetworkAdaptor.urlRequest(urlstring: urlString, method: .get, headers: headers) { data, response, error in
            self.delegate?.hideLoader()
            if let data = data {
                do {
                    
                    let searchinitaldata = try JSONDecoder().decode(SearchInitalModel.self, from: data)
                    self.search_inital = searchinitaldata.body ?? []
                    self.delegate?.updateUI()
                    
                } catch {
                    print("error", error.localizedDescription)
                }
            }
            
        }
    }
    
    func getsearchlist(querystring: String) {
       
        let urlString = Url.search.getUrl()
      
        var headers: [String: String] = ["Content-Type": "application/json"]
        headers["Authorization"] = "cf606825b8a045c1aae39f7fe39de6c6"
        
        NetworkAdaptor.urlRequest(urlstring: urlString, method: .get, headers: headers) { data, response, error in
            self.delegate?.hideLoader()
            if let data = data {
                do {
                    print("api call done: searchresult ")
                    let searchinitaldata = try JSONDecoder().decode(SearchModel.self, from: data)
                    self.searchresult = searchinitaldata.response ?? []
                    self.delegate?.updateSearchresult()
                    
                } catch {
                    print("error", error.localizedDescription)
                }
            }
            
        }
    }
}
