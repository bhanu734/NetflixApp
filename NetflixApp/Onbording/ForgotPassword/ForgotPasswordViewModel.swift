//
//  ForgotPasswordViewModel.swift
//  NetflixApp
//
//  Created by Mac on 16/12/22.
//

import UIKit
protocol ForgotPasswordViewModelDelegate {
    func showAlert(title: String, message: String)
    func goto_resetpassword_vc(email: String)
}
class ForgotPasswordViewModel {
    
    var delegate: ForgotPasswordViewModelDelegate?
    
    func submitTapped(email: String?, dob: String?) {
        if let email = email , let dob = dob {
            if email.replacingOccurrences(of: " ", with: "") != "" {
                if dob.replacingOccurrences(of: " ", with: "") != "" {
                    if isValidEmail(email){
                        if isValidDate(dateString: dob){
                            getUserdetails(email: email, dob: dob)
                            
                        }else {
                            delegate?.showAlert(title: Strings.shared.doberrortitle, message: Strings.shared.doberrormessage)
                        }
                    }else {
                        delegate?.showAlert(title: Strings.shared.error_title, message: Strings.shared.email_error_message)
                    }
                }else {
                    delegate?.showAlert(title: Strings.shared.error_title, message: Strings.shared.doberrormessage)
                }
            }else {
                delegate?.showAlert(title: Strings.shared.error_title, message: Strings.shared.email_error_message)
            }
        }else {
            delegate?.showAlert(title: Strings.shared.error_title, message: Strings.shared.something_error_message)
        }
    }
    
    func getUserdetails(email: String, dob: String) {
        
        let urlString = Url.forgotpassword.getUrl()
        let headers: [String: String] = ["Content-Type" : "application/json"]
        var bodyparameters: [String: Any] = [:]
        bodyparameters["email"] = email
        bodyparameters["dob"] = dob

        NetworkAdaptor.urlRequest(urlstring: urlString, method: .post, urlparameters: nil, bodyparameters: bodyparameters, headers: headers) { data, response, error in
            if let data = data {
                do{
                    if let Jsonresponse = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String:Any] {
                        if let status = Jsonresponse["statusCode"] as? Int {
                            if status == 200 {
                                 print("show success alert redirect reset-password screen")
                                self.delegate?.goto_resetpassword_vc(email: email)
                            }else {
                                    if let errormessage = Jsonresponse["data"] as? String {
                                        print("response 5:", errormessage)
                                        self.delegate?.showAlert(title: Strings.shared.error_title, message: Strings.shared.dob_mismatch)
                                    } else {
                                        print("response4:", Jsonresponse["body"] as? String)
                                        self.delegate?.showAlert(title: Strings.shared.error_title, message: Strings.shared.not_a_vallid_user)
                                    }
                                        self.delegate?.showAlert(title: Strings.shared.error_title, message: Strings.shared.something_error_message)
                                }
                            }
                        
                    }
                    
                }catch {
                    self.delegate?.showAlert(title: Strings.shared.error_title, message: Strings.shared.something_error_message)
                }
            }
        }
    }
 
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidDate(dateString: String) -> Bool {
       let dateFormatterGet = DateFormatter()
       dateFormatterGet.dateFormat = "dd-MM-yyyy"
       if let _ = dateFormatterGet.date(from: dateString) {
           //date parsing succeeded, if you need to do additional logic, replace _ with some variable name i.e date
           return true
       } else {
           // Invalid date
           return false
       }
   }
}
