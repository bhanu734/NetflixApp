//
//  HomeData.swift
//  NetflixApp
//
//  Created by Mac on 28/12/22.
//

import Foundation


// MARK: - HomeModel
struct HomeModel: Codable {
    let statusCode: Int?
    let body: HomeBody?
}

// MARK: - Body
struct HomeBody: Codable {
    let data: HomeData?
}

// MARK: - DataClass
struct HomeData: Codable {
    let id: Int?
    let title, type: String?
    let banner: [Banner]?
    let playlists: [Playlist]?
}

// MARK: - Banner
struct Banner: Codable {
    let id: Int?
    let originalLanguage: String?
    let originalTitle: String?
    let contentType: ContentType?
    let imagery: Imagery?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case contentType = "content_type"
        case imagery, name
    }
    
    func getTitle() -> String? {
        if originalTitle != nil && originalTitle != "" {
            return originalTitle
        }else {
            return name
        }
    }
}

enum ContentType: String, Codable {
    case movie = "movie"
    case series = "series"
}

// MARK: - Imagery
struct Imagery: Codable {
    let banner, thumbnailV, thumbnailS: String?

    enum CodingKeys: String, CodingKey {
        case banner
        case thumbnailV = "thumbnail_v"
        case thumbnailS = "thumbnail_s"
    }
}


// MARK: - Playlist
struct Playlist: Codable {
    let id: Int?
    let title: String?
    let content: [Banner]?
}

struct SearchInitalModel: Codable {
    let statusCode: Int?
    let body: [Banner]?
}

struct SearchModel: Codable {
    let status: Int?
    let response: [Banner]?
}

struct  RelatedContent: Codable {
    let status: Int?
    let response: [Banner]?
}
