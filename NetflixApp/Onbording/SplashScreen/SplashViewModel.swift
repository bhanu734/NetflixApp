//
//  SplashViewModel.swift
//  NetflixApp
//
//  Created by Mac on 23/12/22.
//

import UIKit

protocol SplashViewModelDelegate {
    func goto_Login_vc()
    func data_fetch_completed()
}

class SplashViewModel {
    
    var delegate: SplashViewModelDelegate?
    
    
    func getDetails() {
        if User.shared.isLoggedIn , let email = User.shared.email {
            
            userDetails(email: email)
        }else {
            self.delegate?.goto_Login_vc()
        }
    }
    
    func userDetails(email: String) {
        let baseurl = Url.Userdetails.getUrl()
        
        let urlString = baseurl + email
        let headers: [String: String] = ["Content-Type": "application/json"]
        
        NetworkAdaptor.urlRequest(urlstring: urlString, method: .get, headers: headers) { data, response, error in
            
            if let data = data {
                do {
                    let Jsonresponse = try JSONDecoder().decode(LoginModelData.self, from: data)
                            
                    User.shared.userdetails = Jsonresponse.data
                    
                    self.delegate?.data_fetch_completed()
                    
                }catch {
                    self.logout_user()
                    self.delegate?.goto_Login_vc()
                }
            }else {
                self.logout_user()
                self.delegate?.goto_Login_vc()
            }
        }
    }
    
    func logout_user() {
        User.shared.logout_user()
    }
}
