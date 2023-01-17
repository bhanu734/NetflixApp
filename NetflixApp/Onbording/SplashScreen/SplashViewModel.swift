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
    func showLoader()
    func hideLoader()
}

class SplashViewModel {
    
    var delegate: SplashViewModelDelegate?
    var dispatchgroup: DispatchGroup = DispatchGroup()
    
    func getDetails() {
        if User.shared.isLogin , let email = User.shared.email {
            
            userDetails(email: email)
        }
        
        getHomedata()
        get_TvShows_SubCategories()
        get_Movies_SubCategories()
        
        dispatchgroup.notify(queue: .global(qos: .userInteractive)) {
           print("dispatch group notifier called")
            if User.shared.isLogin {
                print("notifier if called")
                self.delegate?.data_fetch_completed()
            }else{
                print("notifier else called")
                self.delegate?.goto_Login_vc()
            }
        }
        
    }
    
    func userDetails(email: String) {
        dispatchgroup.enter()
        
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
            print("User_details Api called")
            self.dispatchgroup.leave()
        }
    }
    
    func logout_user() {
        User.shared.logout_user()
    }
    
    func getHomedata() {
        dispatchgroup.enter()
        let urlString = Url.Home.getUrl()
      
        var headers: [String: String] = ["Content-Type": "application/json"]
        headers["Authorization"] = "cf606825b8a045c1aae39f7fe39de6c6"
        
        NetworkAdaptor.urlRequest(urlstring: urlString, method: .get, headers: headers) { data, response, error in
            
            if let data = data {
                do {
                    
                    let homedata = try JSONDecoder().decode(HomeModel.self, from: data)
                    AppData.shared.homeData = homedata.body?.data
                    self.dispatchgroup.leave()
                    print("HomeData Api called")
                } catch {
                    print("error", error.localizedDescription)
                    self.getHomedata()
                }
            }else {
                self.getHomedata()
            }
            
        }
    }
    func get_TvShows_SubCategories() {
        dispatchgroup.enter()
        let urlString = Url.tvShowCategories.getUrl()
      
        var headers: [String: String] = ["Content-Type": "application/json"]
        headers["Authorization"] = "cf606825b8a045c1aae39f7fe39de6c6"
        
        NetworkAdaptor.urlRequest(urlstring: urlString, method: .get, headers: headers) { data, response, error in
            
            if let data = data {
                do {
                    
                    if let jsonData = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String : Any] {
                        if let categories = jsonData["body"] as? [String] {
                            AppData.shared.tvshowCategories = categories
                           
                        }
                    }
                } catch {
                    print("error", error.localizedDescription)
                }
            }
            print("Tv_Shows Api called")
            self.dispatchgroup.leave()
        }
    }
    func get_Movies_SubCategories() {
        dispatchgroup.enter()
        let urlString = Url.movieCategories.getUrl()
      
        var headers: [String: String] = ["Content-Type": "application/json"]
        headers["Authorization"] = "cf606825b8a045c1aae39f7fe39de6c6"
        
        NetworkAdaptor.urlRequest(urlstring: urlString, method: .get, headers: headers) { data, response, error in
            
            if let data = data {
                do {
                    
                    if let jsonresponseData = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String : Any] {
                        if let categories = jsonresponseData["body"] as? [String] {
                            AppData.shared.moviesCategories = categories
                           
                        }
                    }
                } catch {
                    print("error", error.localizedDescription)
                }
            }
            print("Movies Api called")
            self.dispatchgroup.leave()
        }
    }
}
