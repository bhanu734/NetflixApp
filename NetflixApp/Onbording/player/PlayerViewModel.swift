//
//  PlayerViewModel.swift
//  NetflixApp
//
//  Created by Mac on 22/02/23.
//

import UIKit
protocol PlayerViewModelDelegate {
    func showLoader()
    func hideLoader()
}

class PlayerViewModel {
 
    var delegate: PlayerViewModelDelegate?
    var banner: Banner?
    
    func getVideoUrl() {
       if let contentType = banner?.contentType?.rawValue , let videoId = banner?.id {
            delegate?.showLoader()
            
            var headers : [String: String] = [ : ]
            headers["Authorization"] = "cf606825b8a045c1aae39f7fe39de6c6"
            headers["Content-Type"] = "application/json"
        
            var bodyparameters: [String: Any] = [:]
            bodyparameters["episodenumber"] = 1
            
            let urlString = Url.videourl.getUrl() + "type=\(contentType)&videoid=\(videoId)"
            
            NetworkAdaptor.urlRequest(urlstring: urlString, method: .post, urlparameters: nil, bodyparameters: bodyparameters, headers: headers) { data, response, error in
            
            self.delegate?.hideLoader()
                
                if let data = data {
                   
                     
                } else {
                    print("error", error?.localizedDescription )
                }
            }
        }
    
        
    }
}
