//
//  ServiceProtocol.swift
//  Exo
//
//  Created by Aimen on 09/06/2024.
//

import Foundation

protocol ServiceProtocol {
    func getMovieList(page: Int) async throws -> [MovieDetail]
    func getImageUrl(path: String, width:Int?) -> URL?
}

