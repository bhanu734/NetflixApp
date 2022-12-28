//
//  LoginViewModel.swift
//  NetflixApp
//
//  Created by Mac on 14/12/22.
//

import UIKit
protocol LoginViewModelDelegate {
    func showAlert(title: String, message: String)
    func gotoprofileselectionScreen()
    func gotoCreateprofilescreen()
}
class LoginViewModel {
    var delegate: LoginViewModelDelegate?
    
    func siginTapped(email: String?, password: String?) {
        if let email = email , let password = password {
            if email.replacingOccurrences(of: " ", with: "") != "" {
                if password.replacingOccurrences(of: " ", with: "") != "" {
                    if isValidEmail(email) {
                        
                        Loginuser(email: email, password: password)
                        
                    }
                } else {
                    
                    delegate?.showAlert(title: Strings.shared.password_error_title, message: Strings.shared.password_error_message)
                }
            }else {
                
                delegate?.showAlert(title: Strings.shared.email, message: Strings.shared.email_error_message)
            }
        }
    }
    

    
    func Loginuser(email:String, password: String) {

        let urlstring = Url.login.getUrl()
        let headers : [String: String] = ["Content-Type" : "application/json"]
        var bodyparameters: [String: Any] = [:]
            bodyparameters["email"] = email
            bodyparameters["password"] = password

        NetworkAdaptor.urlRequest(urlstring: urlstring, method: .post, urlparameters: nil, bodyparameters: bodyparameters, headers: headers) { data, response , error in
            if let data = data {
             do {
                 if  let decodedata = try JSONDecoder().decode(LoginModelData?.self, from: data) {
                 print("Decode Done showing data :", decodedata.data)
//                         self.delegate?.showAlert(title: Strings.shared.login_success, message: Strings.shared.login_sucess_message )
                    if let status = decodedata.statusCode {
                        if status == 200 {
                            if let userdetailsdata = decodedata.data {
                                User.shared.userdetails = userdetailsdata
//                                UserDefaults.standard.setValue(userdetailsdata.email ?? "", forKey: email_UD)
                                if let profiles = userdetailsdata.profiles, profiles.count >= 1{
                                    print("Go to profile selection screen")
                                    self.delegate?.gotoprofileselectionScreen()
                                   
                                } else {
                                    print(" go to create ptofile screen")
                                    self.delegate?.gotoCreateprofilescreen()
                                }
                            } else {
                                print("something went wrong")
                            }
                        }else {
                            print("something went wrong")
                        }
                    }
                  
                 }
             } catch {
                 print("decode not done invalid id password", error.localizedDescription)
                self.delegate?.showAlert(title: Strings.shared.error_title, message: Strings.shared.login_failure_message )
                 
                         do {
                            if let jsonresponse = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any] {
                             if let status = jsonresponse["statusCode"] as? Int {
                                 if status == 200 {
                                     print("login success 15-12-2022")
                                 }else {
                                     print("Wrong pasword:",jsonresponse["data"] as? String)
                                 }
                             }
                             }
                         } catch {
                             self.delegate?.showAlert(title: Strings.shared.error_title, message: Strings.shared.something_error_message)
                         }
                     
                 }
             
             }
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
        
    }
    
    
}
