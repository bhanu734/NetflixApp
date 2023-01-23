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
    case forgotpassword
    case resetpassword
    case createprofiles
    case Userdetails
    case Home
    case tvShowCategories
    case movieCategories
    case deleteprofile
    case tvshows
    case movies
    
    func getUrl() -> String {
        switch self {
        case.login:
            return "https://jwxebkwcfj.execute-api.us-east-1.amazonaws.com/dev/login?type=email"
        case.register:
            return "https://jwxebkwcfj.execute-api.us-east-1.amazonaws.com/dev/register?type=email"
        case.forgotpassword:
            return "https://jwxebkwcfj.execute-api.us-east-1.amazonaws.com/dev/forgot-password?type=email"
        case.resetpassword:
            return "https://jwxebkwcfj.execute-api.us-east-1.amazonaws.com/dev/reset-password?type=email"
        case.createprofiles:
            return "https://jwxebkwcfj.execute-api.us-east-1.amazonaws.com/dev/update-user"
        case.Userdetails:
            return "https://jwxebkwcfj.execute-api.us-east-1.amazonaws.com/dev/user-details?email="
        case .Home:
            return "https://jwxebkwcfj.execute-api.us-east-1.amazonaws.com/dev/home"
        case .tvShowCategories:
            return "https://jwxebkwcfj.execute-api.us-east-1.amazonaws.com/dev/tvcategories"
        case .movieCategories:
            return "https://jwxebkwcfj.execute-api.us-east-1.amazonaws.com/dev/moviecategories"
        case .deleteprofile:
            return "https://jwxebkwcfj.execute-api.us-east-1.amazonaws.com/dev/update-user"
        case .tvshows:
            return "https://jwxebkwcfj.execute-api.us-east-1.amazonaws.com/dev/tvshows"
        case .movies:
            return "https://jwxebkwcfj.execute-api.us-east-1.amazonaws.com/dev/movies"
            
            
        }
    }
}
