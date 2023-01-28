//
//  CategoryDataModel.swift
//  NetflixApp
//
//  Created by Mac on 27/01/23.
//

import Foundation

// MARK: - HomeModel
struct CategoryDataModel: Codable {
    let statusCode: Int?
    let body: CategoryDataBody?
}

// MARK: - Body
struct CategoryDataBody: Codable {
    let data: CategoryData?
}

// MARK: - DataClass
struct CategoryData: Codable {
    let title, type: String?
    let banner: Banner?
    let playlists: [Banner]?
}

