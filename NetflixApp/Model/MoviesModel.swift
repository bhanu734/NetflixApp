//
//  MoviesModel.swift
// 

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let moviesData = try? newJSONDecoder().decode(MoviesData.self, from: jsonData)

import Foundation

// MARK: - MoviesData
struct MovieDetails: Codable {
    let statusCode: Int?
    let data: MoviesData?
}

// MARK: - DataClass
struct MoviesData: Codable {
    let id: Int?
    let adult: Bool?
    let revenue: Int?
    let originalTitle: String?
    let productionCompanies: [ProductionCompany]?
    let imagery: Imagery?
    let spokenLanguages: [SpokenLanguage]?
    let contentType: String?
    let popularity: Double?
    let runtime: Int?
    let title, overview: String?
    let budget, voteCount: Int?
    let releaseDate: String?
    let genres: [Genre]?
    let status: String?
    let voteAverage: Double?

    enum CodingKeys: String, CodingKey {
        case id, adult, revenue
        case originalTitle = "original_title"
        case productionCompanies = "production_companies"
        case imagery
        case spokenLanguages = "spoken_languages"
        case contentType = "content_type"
        case popularity, runtime, title, overview, budget
        case voteCount = "vote_count"
        case releaseDate = "release_date"
        case genres, status
        case voteAverage = "vote_average"
    }
}

// MARK: - Genre
struct Genre: Codable {
    let name: String?
}

// MARK: - Imagery
//struct Imagery: Codable {
//    let banner, thumbnailS, thumbnailV: String?
//
//    enum CodingKeys: String, CodingKey {
//        case banner
//        case thumbnailS = "thumbnail_s"
//        case thumbnailV = "thumbnail_v"
//    }
//}

// MARK: - SpokenLanguage
struct SpokenLanguage: Codable {
    let englishName, name: String?

    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
        case name
    }
}
