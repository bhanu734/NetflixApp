//
//  RegisterViewModel.swift
//  NetflixApp
//
//  Created by Mac on 12/12/22.
//

import UIKit
protocol RegisterViewModelDelgate {
    func showAlert(title: String, message: String)
}
class RegisterViewModel {
    var delegate: RegisterViewModelDelgate?
    
    func registerTapped(email: String?, password: String?, Confirm_password: String?, Dateofbirth: String?) {
        if let email = email, let password = password ,let  Confirm_password = Confirm_password,let Dateofbirth = Dateofbirth {
            if email.replacingOccurrences(of: " ", with: "") != "" {
                if password.replacingOccurrences(of: " ", with: "") != "" {
                    if Confirm_password.replacingOccurrences(of: " ", with: "") != "" {
                        if Dateofbirth.replacingOccurrences(of: " ", with: "") != "" {
                            if isValidEmail(email) {
                                if password == Confirm_password {
                                    if isValidDate(dateString: Dateofbirth) {
                                        registeruser(email: email, password: password, dob: Dateofbirth)
                                        print("user registered sucessfull")
                                    }else {
                                        print("enter vallid Dob")
                                        delegate?.showAlert(title: Strings.shared.doberrortitle, message: Strings.shared.doberrormessage)
                                    }
                                }else {
                                    print("password & confirmpassword doesn't match")
                                    delegate?.showAlert(title: Strings.shared.password_confirmpassword_error_title, message: Strings.shared.password_confirmpassword_error_message)
                                }
                            }else {
                                print("enter vallid email")
                                delegate?.showAlert(title: Strings.shared.email_error_title, message: Strings.shared.email_error_message)
                            }
                        } else {
                            print("enter Dob")
                            delegate?.showAlert(title: Strings.shared.doberrortitle, message: Strings.shared.doberrormessage)
                        }
                        
                    } else {
                        print("enter confirm password")
                        delegate?.showAlert(title: Strings.shared.confirmpassword_error_title, message: Strings.shared.confirmpassword_error_message)
                    }
                } else {
                    print("enter Password")
                    delegate?.showAlert(title: Strings.shared.password_error_title, message: Strings.shared.password_error_message)
                }
            } else {
                print("enter email")
                delegate?.showAlert(title: Strings.shared.email_error_title, message: Strings.shared.email_error_message)
            }
            
        } else {
            
            delegate?.showAlert(title: Strings.shared.error_title, message: Strings.shared.something_error_message)
        }
    }
    func registeruser(email:String, password:String, dob: String) {
//        let urlString = "https://jwxebkwcfj.execute-api.us-east-1.amazonaws.com/dev/register?type=email"
//        guard let url = URL(string: urlString) else { return }
//
//        var urlrequest = URLRequest(url: url)
//            urlrequest.httpMethod = "POST"
//
//        let headers: [String: String] = ["Content-Type" : "application/json"]
//        urlrequest.allHTTPHeaderFields = headers
//
//        var bodyparameters: [String: Any] = [:]
//        bodyparameters["email"] = email
//        bodyparameters["password"] = password
//        bodyparameters["dob"] = dob

//        do{
//            let bodydata = try JSONSerialization.data(withJSONObject: bodyparameters, options: .prettyPrinted)
//            urlrequest.httpBody = bodydata
//
//            URLSession.shared.dataTask(with: urlrequest) { data , response , error in
//                if let data = data {
//                    do {
//                       if let jsonresponse = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any] {
//                        if let status = jsonresponse["statusCode"] as? Int {
//                            if status == 200 {
//                                print("show success alert redirect login screen")
//                            }else {
//                                if let  errormessage = jsonresponse["data"] as? String {
//                                    print(errormessage)
//                                self.delegate?.showAlert(title: Strings.shared.error_title, message: Strings.shared.registration_failed)
//                                } else {
//                                    self.delegate?.showAlert(title: Strings.shared.error_title, message: Strings.shared.something_error_message)
//                                }
//                            }
//                        }
//                        }
//                    } catch {
//
//                        self.delegate?.showAlert(title: Strings.shared.error_title, message: Strings.shared.something_error_message)
//                    }
//                }
//            }.resume()
//        }catch {
//            self.delegate?.showAlert(title: Strings.shared.error_title, message: Strings.shared.something_error_message)
//        }
        
        let urlString = Url.register.getUrl()
        let headers: [String: String] = ["Content-Type" : "application/json"]
        var bodyparameters: [String: Any] = [:]
        bodyparameters["email"] = email
        bodyparameters["password"] = password
        bodyparameters["dob"] = dob

        NetworkAdaptor.urlRequest(urlstring: urlString, method: "POST", urlparameters: nil, bodyparameters: bodyparameters, headers: headers) { data, response , error in
            if let data = data {
                do {
                   if let jsonresponse = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any] {
                    if let status = jsonresponse["statusCode"] as? Int {
                        if status == 200 {
                            print("show success alert redirect to login screen")
                        }else {
                            if let  errormessage = jsonresponse["data"] as? String {
                                print(errormessage)
                            self.delegate?.showAlert(title: Strings.shared.error_title, message: Strings.shared.registration_failed)
                            } else {
                                self.delegate?.showAlert(title: Strings.shared.error_title, message: Strings.shared.something_error_message)
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
