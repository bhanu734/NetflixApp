//
//  DetailsViewModel.swift
//  NetflixApp
//
//  Created by Mac on 06/02/23.
//

import UIKit

protocol DetailsViewModelDelegate {
    func showLoader()
    func hideLoader()
    func updateUI()
}

class DetailsViewModel {
    
    var banner: Banner?
    var isSeries : Bool {
        return banner?.contentType == .none
    }
    
    var delegate: DetailsViewModelDelegate?
   
    var movieDetails: MoviesData?
    var seriesDetails: SeriesData?
    
    func getDetails() {
        if let id = banner?.id {
            if isSeries {
                getSeriesDetails(id: id)
            }else {
                getMoviesDetails(id: id)
            }
        }
    }
    
    func getMoviesDetails(id: Int) {
        delegate?.showLoader()
        let headers: [String: String] = ["Content-Type": "application/json"]
        let baseUrl = Url.movieDetails.getUrl()
        let urlString = baseUrl + String(id)
        
        NetworkAdaptor.urlRequest(urlstring: urlString, method: .get, headers: headers) { data, response, error in
            self.delegate?.hideLoader()
            if let data = data {
                do{
                    let jsonResponse = try JSONDecoder().decode(MovieDetails.self, from: data)
                    self.movieDetails = jsonResponse.data
                    print(self.movieDetails?.title, self.movieDetails?.originalTitle )
                    self.delegate?.updateUI()
                }catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func getSeriesDetails(id: Int)  {
        delegate?.showLoader()
        let headers: [String: String] = ["Content-Type": "application/json"]
        let baseUrl = Url.seriesDetails.getUrl()
        let urlString = baseUrl + String(id)
        
        NetworkAdaptor.urlRequest(urlstring: urlString, method: .get, headers: headers) { data, response, error in
            self.delegate?.hideLoader()
            if let data = data {
                do{
                    let jsonResponse = try JSONDecoder().decode(SeriesDetailsModel.self, from: data)
                    self.seriesDetails = jsonResponse.data?.response
                    print(self.seriesDetails?.name)
                    self.delegate?.updateUI()
                }catch{
                    
                }
                
            }
        }
    }
}
