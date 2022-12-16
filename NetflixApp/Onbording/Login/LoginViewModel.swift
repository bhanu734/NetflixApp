//
//  LoginViewModel.swift
//  NetflixApp
//
//  Created by Mac on 14/12/22.
//

import UIKit
protocol LoginViewModelDelegate {
    func showalert(title: String, message: String)
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
                    
                    delegate?.showalert(title: Strings.shared.password_error_title, message: Strings.shared.password_error_message)
                }
            }else {
                
                delegate?.showalert(title: Strings.shared.email, message: Strings.shared.email_error_message)
            }
        }
    }
    

    
    func Loginuser(email:String, password: String) {
//        let urlstring = "https://jwxebkwcfj.execute-api.us-east-1.amazonaws.com/dev/login?type=email"
//        guard let url = URL(string: urlstring) else {return}
//
//        var urlrequest = URLRequest(url: url)
//            urlrequest.httpMethod = "POST"
//
//        let headers : [String: String] = ["Content-Type" : "application/json"]
//            urlrequest.allHTTPHeaderFields = headers
//
//        var bodyparameters: [String: Any] = [:]
//            bodyparameters["email"] = email
//            bodyparameters["password"] = password

//        do {
//            let bodydata = try JSONSerialization.data(withJSONObject: bodyparameters, options: .prettyPrinted)
//            urlrequest.httpBody = bodydata
//
//            URLSession.shared.dataTask(with: urlrequest) { data, response, error in
//               if let data = data {
//                do {
//                    if  let decodedata = try JSONDecoder().decode(LoginModelData?.self, from: data) {
//                    print("Decode Done showing data :", decodedata.data)
//                        DispatchQueue.main.async {
//                            self.delegate?.showalert(title: Strings.shared.login_success, message: Strings.shared.login_sucess_message )
//                        }
//
//                    }
////                    if (try JSONDecoder().decode(LoginModelData.self, from: data)) != nil {
////                        print("decode data" )
////                    }
//                } catch {
//                    print("decode not done invalid id password", error.localizedDescription)
//   self.delegate?.showalert(title: Strings.shared.error_title, message: Strings.shared.login_Wrongpassword )
//                    URLSession.shared.dataTask(with: urlrequest) { data , response , error in
//                        if let data = data {
//                            do {
//                               if let jsonresponse = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any] {
//                                if let status = jsonresponse["statusCode"] as? Int {
//                                    if status == 200 {
//                                        print("login success 15-12-2022")
//                                    }else {
//                                        print("Wrong pasword:",jsonresponse["data"] as? String)
//                                    }
//                                }
//                                }
//                            } catch {
//                                self.delegate?.showalert(title: Strings.shared.error_title, message: Strings.shared.something_error_message)
//                            }
//                        }
//                    }.resume()
//                }
//                }
//            }.resume()
//        } catch {
//
//            self.delegate?.showalert(title: Strings.shared.error_title, message: Strings.shared.something_error_message)
//        }
        let urlstring = Url.login.getUrl()
        let headers : [String: String] = ["Content-Type" : "application/json"]
        var bodyparameters: [String: Any] = [:]
            bodyparameters["email"] = email
            bodyparameters["password"] = password

        NetworkAdaptor.urlRequest(urlstring: urlstring, method: "POST", urlparameters: nil, bodyparameters: bodyparameters, headers: headers) { data, response , error in
            if let data = data {
             do {
                 if  let decodedata = try JSONDecoder().decode(LoginModelData?.self, from: data) {
                 print("Decode Done showing data :", decodedata.data)
                         self.delegate?.showalert(title: Strings.shared.login_success, message: Strings.shared.login_sucess_message )
                 }
//                    if (try JSONDecoder().decode(LoginModelData.self, from: data)) != nil {
//                        print("decode data" )
//                    }
             } catch {
                 print("decode not done invalid id password", error.localizedDescription)
                self.delegate?.showalert(title: Strings.shared.error_title, message: Strings.shared.login_failure_message )
                 
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
                             self.delegate?.showalert(title: Strings.shared.error_title, message: Strings.shared.something_error_message)
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
