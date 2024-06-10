//
//  MovieUseCase.swift
//  Exo
//
//  Created by Aimen on 09/06/2024.
//

import Foundation

class MovieUseCase {
    private var service: ServiceProtocol
    private var nextPage: Int = 1

    
    init(service: ServiceProtocol = ApiService()) {
        self.service = service
    }
    
    func getNextPage() async -> [MovieDetail]? {
        do {
            let movieList = try await self.service.getMovieList(page: self.nextPage)
            self.nextPage += 1
            return movieList
        } catch {
             return nil
        }
    }
    
    func getImageUrl(path: String, width: Int?) -> URL? {
        self.service.getImageUrl(path: path, width: width)
    }
    
}
