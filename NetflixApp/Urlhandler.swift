//
//  Urlhandler.swift
//  NetflixApp
//
//  Created by Mac on 16/12/22.
//

import UIKit

enum Url {
    case login
    case register
    
    func getUrl() -> String {
        switch self {
        case.login:
            return "https://jwxebkwcfj.execute-api.us-east-1.amazonaws.com/dev/login?type=email"
        case.register:
            return "https://jwxebkwcfj.execute-api.us-east-1.amazonaws.com/dev/register?type=email"
        
        }
    }
}
