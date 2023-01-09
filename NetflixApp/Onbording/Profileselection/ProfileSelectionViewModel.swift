//
//  ProfileSelectionViewModel.swift
//  NetflixApp
//
//  Created by Mac on 22/12/22.
//

import UIKit

protocol ProfileSelectionViewModelDelegate {
    func showAlert(title: String, message: String)
}
class ProfileSelectionViewModel {
    
    var delegate:  ProfileSelectionViewModelDelegate?
    var  profiles : [Profile] {
        return User.shared.userdetails?.profiles ?? []
    }
    
    
    func deleteProfile(profile: Profile) {
        
        let urlstring = Url.deleteprofile.getUrl()
        let headers : [String: String] = ["Content-Type" : "application/json"]
        var bodyparameters: [String: Any] = [:]
        bodyparameters["email"] = User.shared.email
        bodyparameters["profile"] = ["profileId": profile.profileID]
        
        NetworkAdaptor.urlRequest(urlstring: urlstring, method: .delete, urlparameters: nil, bodyparameters: bodyparameters, headers: headers) { data, response, error in
            
            if let data = data {
                
                do {
                    let Jsonresponse = try JSONSerialization.jsonObject(with: data , options: .fragmentsAllowed) as? [String : Any]
                    
                    if let statuscode = Jsonresponse?["statusCode"] as? Int {
                        if statuscode == 200 {
                            self.getUserDetails()
                            
                        } else {
                            let errormessage = Jsonresponse?["data"] as? String
                            print("error" ,errormessage)
                        }
                    } else {
                       
                    }
                } catch {
                    print("error", error.localizedDescription)
                }
                
                
            } else {
                print("error", error?.localizedDescription )
            }
        }
                    
    }
    
    func getUserDetails() {
        if let email = User.shared.email {
            let baseUrl = Url.Userdetails.getUrl()
            let urlString = baseUrl + email

            let headers: [String: String] = ["Content-Type": "application/json"]

            NetworkAdaptor.urlRequest(urlstring: urlString, headers: headers) { data, response, error in
                if let data = data {
                    do {
                        let jsonResponse = try JSONDecoder().decode(LoginModelData.self, from: data)
                        User.shared.userdetails = jsonResponse.data
                        print("data ",jsonResponse)
                        print("user details updated")
                    }catch{
                    print("something wrong in userdetails psvc")
                    }
//                        self.delegate?.hideLoader()?
//                    if let profiles = User.shared.userdetails?.profiles, profiles.count > 1 {
//                        self.delegate?.goToPreviousVc()
//                    }else {
//                        self.delegate?.GotoProfilesscreen()
//                    }
                }else {
                    
                }
            }
        }
    }
}
