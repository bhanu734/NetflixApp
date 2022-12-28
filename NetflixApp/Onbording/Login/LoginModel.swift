//
//  LoginModel.swift
//  NetflixApp
//
//  Created by Mac on 14/12/22.


import UIKit

    // MARK: - Login
    struct LoginModelData: Codable {
        let statusCode: Int?
        let data: UserDetails?
    }

    // MARK: - DataClass
    struct UserDetails: Codable {
        let password, email: String?
        let profiles: [Profile]?
        let userid, dob: String?
    }

    // MARK: - Profile
    struct Profile: Codable {
        let profileName, profileID, profileImage: String?

        enum CodingKeys: String, CodingKey {
            case profileName
            case profileID = "profileId"
            case profileImage
        }
    }


