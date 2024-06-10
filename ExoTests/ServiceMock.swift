//
//  ServiceMock.swift
//  ExoTests
//
//  Created by Aimen on 10/06/2024.
//

import Foundation

enum MyError: Error {
    case runtimeError
}

class ServiceMock: ServiceProtocol {
    lazy var movieDetail: [MovieDetail] = {
        var movieDetail: [MovieDetail] = []
        for index in 0..<10 {
            let model = MovieDetail(id: "\(index)", title: "title \(index)", overview: "overview \(index)", posterUrl: "", voteAverage: "")
            movieDetail.append(model)
        }
        return movieDetail
    }()
    
    func getMovieList(page: Int) async throws -> [MovieDetail] {
        if page == 1 {
            return self.movieDetail
        }
        
        if page == 2 {
            return []
        }
        
        if page == 3 {
            throw MyError.runtimeError
        }
        return [self.movieDetail[0]]
    }
    
    func getImageUrl(path: String, width: Int?) -> URL? {
        return nil
    }
    
       
}
