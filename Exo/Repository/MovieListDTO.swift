//
//  MovieListDTO.swift
//  Exo
//
//  Created by Aimen on 09/06/2024.
//

import Foundation

struct MovieListDTO: Decodable {
    var page: Int
    var list : [MovieDetailDTO]
    enum CodingKeys: String, CodingKey {
        case page
        case list = "results"
    }
    
    func toDomain()-> [MovieDetail] {
        self.list.map { $0.toDomain() }
    }
}
