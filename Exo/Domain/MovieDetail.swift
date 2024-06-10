//
//  MovieDetail.swift
//  Exo
//
//  Created by Aimen on 09/06/2024.
//

import Foundation

struct MovieDetail: Identifiable, Hashable {
    var id: String
    var title: String
    var overview: String
    var posterUrl: String
    var voteAverage: String
}
