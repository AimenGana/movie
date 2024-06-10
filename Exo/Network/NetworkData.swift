//
//  NetworkData.swift
//  Exo
//
//  Created by Aimen on 09/06/2024.
//

import Foundation

enum NetworkData {
    static var apiKey: String = "d3183cb0d64d18805b3ec290af949b18"
    
    static var apiToken: String = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkMzE4M2NiMGQ2NGQxODgwNWIzZWMyOTBhZjk0OWIxOCIsInN1YiI6IjY1NDNjMjAwNzcxOWQ3MDBhZGM0ZjFlZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.o0q1qKSudE-yh83nYzxjm4jX7hBmBaSkUcXrqi3qyzo"
    static var baseUrl: String = "https://api.themoviedb.org/3"
    static var imagBbaseUrl: String  = "https://image.tmdb.org/t/p/"
    
    enum ApiUrl {
        case movieListURL(page: Int)
        case movieDetail(movieId: Int)
        case imageUrl(path: String, width: Int?)

        var url: URL? {
            switch self {
            case .movieListURL(let page):
                var path = "\(NetworkData.baseUrl)/movie/popular?page=\(page)"
                return URL(string: path)
                
            case .movieDetail(let movieId):
                return URL(string:"\(NetworkData.baseUrl)/movie/\(movieId)/credits")
                
            case .imageUrl(let path, let width):
                if let width = width {
                    return URL(string:"\(NetworkData.imagBbaseUrl)w\(width)\(path)")
                }
                return URL(string:"\(NetworkData.imagBbaseUrl)original\(path)")
            }
        }
    }
}
