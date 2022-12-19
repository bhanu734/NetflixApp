//
//  ResetPasswordViewModel.swift
//  NetflixApp
//
//  Created by Mac on 16/12/22.
//

import UIKit
protocol ResetPasswordViewModelDelegate {
    func showAlert(title: String, message: String)
    func showAlert_vc(title: String, message: String)
}

class ResetPasswordViewModel {
    
    var email: String =  ""
    var delegate: ResetPasswordViewModelDelegate?
    
    func submitTapped(password: String?, confirmpassword: String?) {
        if let password = password , let confirmpassword = confirmpassword {
            if password.replacingOccurrences(of: " ", with: "") != "" {
                if confirmpassword.replacingOccurrences(of: " ", with: "") != "" {
                    if password == confirmpassword {
                        updatepassword(password: password)
                    }else {
                        delegate?.showAlert(title: Strings.shared.error_title, message: Strings.shared.password_confirmpassword_error_message)
                    }
                }else {
                    delegate?.showAlert(title: Strings.shared.error_title, message: Strings.shared.confirmpassword_error_message)
                }
            } else {
                delegate?.showAlert(title: Strings.shared.error_title, message: Strings.shared.password_error_message)
            }
        }else {
            delegate?.showAlert(title: Strings.shared.error_title, message: Strings.shared.something_error_message)
        }
    }
    
    func updatepassword(password: String?) {
        let urlString = Url.resetpassword.getUrl()
        let headers: [String: String] = ["Content-Type" : "application/json"]
        var bodyparameters: [String: Any] = [:]
        bodyparameters["email"] = email
        bodyparameters["password"] = password

        NetworkAdaptor.urlRequest(urlstring: urlString, method: .put, urlparameters: nil, bodyparameters: bodyparameters, headers: headers) { data, response, error in
            if let data = data {
                do{
                   if let Jsonrespone = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any] {
                    if let status = Jsonrespone["statusCode"] as? Int {
                        if status == 200 {
                            print("update newpassword: ", status)
                            self.delegate?.showAlert_vc(title: Strings.shared.success, message: Strings.shared.update_newpassword)
                        }else {
                            if let errormessage = Jsonrespone["body"] as? String {
                                print("response:",errormessage)
                                self.delegate?.showAlert(title: Strings.shared.success, message: Strings.shared.email_verified)
                            } else {
                                print("response4:", Jsonrespone["body"] as? String)
                                self.delegate?.showAlert(title: Strings.shared.error_title, message: Strings.shared.not_a_vallid_user)
                            }
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
