//
//  CreateProfileViewModel.swift
//  NetflixApp
//
//  Created by Mac on 19/12/22.
//

import UIKit

protocol CreateProfileViewModelDelegate {
   func GotoProfilesscreen()
    func goToPreviousVc() 
}

class CreateProfileViewModel {
    
    var delegate: CreateProfileViewModelDelegate?
        
        func CreateProfile(profileName:String?, profileImage:String?){
            if let profileName = profileName {
                if profileName.replacingOccurrences(of: " ", with: "") != "" {
                    if let profileImage = profileImage {
                        
                            updateUser(profileName: profileName, profileImage: profileImage)
                        
                        print("profile created")
                    }
                }else {
//                    delegate?.showAlert(title: Strings.shared.error, message: Strings.shared.profileNameIsMandarory)
                }
            }else {
//                delegate?.showAlert(title: Strings.shared.error, message: Strings.shared.profileNameIsMandarory)
            }
        }
            
        func updateUser(profileName:String, profileImage:String) {
            if let email = User.shared.email {
               
                
                let urlString = Url.createprofiles.getUrl()
                let headers: [String: String] = ["Content-Type": "application/json"]
                let bodyParameters: [String: Any] = ["email":email,"profile":["profileName":profileName,"profileImage":profileImage]]
             
                
                NetworkAdaptor.urlRequest(urlstring: urlString, method: .put, urlparameters: headers, bodyparameters: bodyParameters) { data, response, error in
                    if let data = data {
                        do{
                            if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String:Any] {
                                if let statuscode = jsonResponse["statusCode"] as? Int {
                                    if statuscode == 200 {
                                        self.getUserDetails()
                                        self.delegate?.GotoProfilesscreen()
                                    }else{
                                        if let errorMessage = jsonResponse["body"] as? String {
//                                            self.delegate?.showAlert(title: Strings.shared.error, message: errorMessage)
                                        }else{
//                                            self.delegate?.showAlert(title: Strings.shared.error, message: Strings.shared.somethingWentWrong)
                                        }
                                    }
                                }else{
//                                    self.delegate?.showAlert(title: Strings.shared.error, message: Strings.shared.somethingWentWrong)
                                }
                            }
                        }catch{
//                            self.delegate?.showAlert(title: Strings.shared.error, message: Strings.shared.somethingWentWrong)
                        }
                    }
                }
            }
        }
        
        func getUserDetails() {
            if let email = User.shared.email {
                let baseUrl = Url.Userdetails.getUrl()
                let urlString = baseUrl 

                let headers: [String: String] = ["Content-Type": "application/json"]

                NetworkAdaptor.urlRequest(urlstring: urlString, headers: headers) { data, response, error in
                    if let data = data {
                        do {
                            let jsonResponse = try JSONDecoder().decode(LoginModelData.self, from: data)
                            User.shared.userdetails = jsonResponse.data
                        }catch{

                        }
//                        self.delegate?.hideLoader()?
                        if let profiles = User.shared.userdetails?.profiles, profiles.count > 1 {
                            self.delegate?.goToPreviousVc()
                        }else {
                            self.delegate?.GotoProfilesscreen()
                        }
                    }
                }
            }
        }
    }

    
    
