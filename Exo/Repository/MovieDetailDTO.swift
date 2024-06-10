//
//  MovieDetailDTO.swift
//  Exo
//
//  Created by Aimen on 09/06/2024.
//

import Foundation

struct MovieDetailDTO: Decodable {
    var id: Int
    var title: String
    var overview: String
    var posterUrl: String
    var voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case posterUrl = "poster_path"
        case voteAverage = "vote_average"
    }
    
    func toDomain()-> MovieDetail {
        return MovieDetail(
            id: "\(self.id)",
            title: self.title,
            overview: self.overview,
            posterUrl: self.posterUrl,
            voteAverage: String(format:"%.1f", self.voteAverage)
        )
    }
}
