//
//  Service.swift
//  Exo
//
//  Created by Aimen on 09/06/2024.
//

import Foundation


class ApiService: ServiceProtocol {
    private var networkServie = NetworksService.shared
    
    func getMovieList(page: Int) async throws -> [MovieDetail] {
        let modelDTO = try await self.networkServie.fetchData(
            MovieListDTO.self,
            from: .movieListURL(page: page)
        )
        return modelDTO.toDomain()
    }

    func getImageUrl(path: String, width:Int?) -> URL? {
        NetworkData.ApiUrl.imageUrl(path: path, width: width).url
    }
}
