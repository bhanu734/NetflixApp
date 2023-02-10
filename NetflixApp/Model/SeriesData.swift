

import Foundation

// MARK: - SeriesData
struct SeriesDetailsModel: Codable {
    let data: SeriesDetailsData?
}

// MARK: - DataClass
struct SeriesDetailsData: Codable {
    let statusCode: Int?
    let response: SeriesData?
}

// MARK: - Response
struct SeriesData: Codable {
    let id: Int?
    let adult: Bool?
    let productionCompanies: [ProductionCompany]?
    let voteAverage: Double?
    let numberOfSeasons: Int?
    let imagery: Imagery?
    let voteCount: Int?
    let popularity: Double?
    let type, overview: String?
    let numberOfEpisodes: Int?
    let inProduction: Bool?
    let firstAirDate: String?
    let createdBy: [CreatedBy]?
    let seasons: [Season]?
    let genres: [Genre]?
    let name, status: String?
}

// MARK: - CreatedBy
struct CreatedBy: Codable {
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

// MARK: - ProductionCompany
struct ProductionCompany: Codable {
    let name, originCountry: String?

    enum CodingKeys: String, CodingKey {
        case name
        case originCountry = "origin_country"
    }
}

// MARK: - Season
struct Season: Codable {
    let airDate: String?
    let id, seasonNumber: Int?
    let episodes: [Episode]?
    let name, overview: String?

    enum CodingKeys: String, CodingKey {
        case airDate = "air_date"
        case id
        case seasonNumber = "season_number"
        case episodes, name, overview
    }
}

// MARK: - Episode
struct Episode: Codable {
    let crew: [Crew]?
    let id, seasonNumber, voteCount, episodeNumber: Int?
    let voteAverage: Double?
    let overview, airDate, name: String?

    enum CodingKeys: String, CodingKey {
        case crew, id
        case seasonNumber = "season_number"
        case voteCount = "vote_count"
        case episodeNumber = "episode_number"
        case voteAverage = "vote_average"
        case overview
        case airDate = "air_date"
        case name
    }
}

// MARK: - Crew
struct Crew: Codable {
    let job, name: String?
}
