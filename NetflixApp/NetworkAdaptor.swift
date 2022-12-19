//
//  NetworkAdaptor.swift
//  NetflixApp
//
//  Created by Mac on 15/12/22.
//

import UIKit

enum Httpmethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case pull = "PULL"
}
class NetworkAdaptor {
    static func urlRequest(urlstring: String, method: Httpmethod = .get, urlparameters: [String:String]? = nil, bodyparameters: [String:Any]? = nil, headers: [String:String]? = nil , completion: @escaping ((Data?, URLResponse?, Error?) -> ()) ) {
        
        guard let url = URL(string: urlstring) else {
            completion(nil, nil, nil )
            
            return
            
        }
        
        var urlrequest = URLRequest(url: url)
        urlrequest.httpMethod = method.rawValue
        if let headers = headers {
            urlrequest.allHTTPHeaderFields = headers
        }
        
        do{
            if let bodyparameters = bodyparameters {
                let body = try JSONSerialization.data(withJSONObject: bodyparameters, options: .prettyPrinted)
                urlrequest.httpBody = body
            }
            
            URLSession.shared.dataTask(with: urlrequest) { data, response, error in
                completion(data, response, error)
            }.resume()
        } catch {
            completion(nil, nil, error)
            print("error", error.localizedDescription)
        }
    }
}

