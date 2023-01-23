//
//  HomeViewModel.swift
//  NetflixApp
//
//  Created by Mac on 10/01/23.
//

import UIKit
protocol HomeViewModelDelegate {
    func showLoader()
    func hideLoader()
    func updateUI()
}

class HomeViewModel {
    
    var homedata : HomeData? = AppData.shared.homeData
    var delegate: HomeViewModelDelegate?
    
    func getHomeData() {
        homedata = AppData.shared.homeData
        self.delegate?.updateUI()
    }
    
    func getTvshowsData() {
        if let tvShowData = AppData.shared.tvshowData{
            homedata = tvShowData
            delegate?.updateUI()
        }else {
            self.delegate?.showLoader()
            let urlString = Url.tvshows.getUrl()
          
            var headers: [String: String] = ["Content-Type": "application/json"]
            headers["Authorization"] = "cf606825b8a045c1aae39f7fe39de6c6"
            
            NetworkAdaptor.urlRequest(urlstring: urlString, method: .get, headers: headers) { data, response, error in
                self.delegate?.hideLoader()
                if let data = data {
                    do {
                        
                        let tvshowdata = try JSONDecoder().decode(HomeModel.self, from: data)
                        AppData.shared.tvshowData = tvshowdata.body?.data
                        self.homedata = tvshowdata.body?.data
                        self.delegate?.updateUI()
                        print("tvshow Api called", tvshowdata.body?.data?.playlists?.count)
                    } catch {
                        print("error", error.localizedDescription)
                    }
                }
                
            }
        }
       
    }
    
    func getmoviesData() {
        if let moviesData = AppData.shared.moviesData {
            homedata = moviesData
            delegate?.updateUI()
        }else {
            self.delegate?.showLoader()
            let urlString = Url.movies.getUrl()
          
            var headers: [String: String] = ["Content-Type": "application/json"]
            headers["Authorization"] = "cf606825b8a045c1aae39f7fe39de6c6"
            
            NetworkAdaptor.urlRequest(urlstring: urlString, method: .get, headers: headers) { data, response, error in
                self.delegate?.hideLoader()
                if let data = data {
                    do {
                        
                        let moviesdata = try JSONDecoder().decode(HomeModel.self, from: data)
                        AppData.shared.moviesData = moviesdata.body?.data
                        self.homedata = moviesdata.body?.data
                        self.delegate?.updateUI()
                        print("movies Api called", moviesdata.body?.data?.playlists?.count)
                    } catch {
                        print("error", error.localizedDescription)
                    }
                }
                
            }
        }
        
    }
}


