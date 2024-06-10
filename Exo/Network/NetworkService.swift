//
//  NetworkService.swift
//  Exo
//
//  Created by Aimen on 09/06/2024.
//

import Foundation

enum NetworksError: Error {
    case invalidResponse
    case invalidUrl
    case invalidData
}

class NetworksService {
    static var shared: NetworksService = NetworksService()
    
    private var session = URLSession.shared
    private init() { }
    
    //MARK: public api
    func fetchData<T: Decodable>(_: T.Type ,from apiUrl: NetworkData.ApiUrl) async throws -> T {
        let data =  try await self.fetchData(from: apiUrl)
        guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
            throw NetworksError.invalidData
        }
        return decodedData
    }
    
    func fetchData(from apiUrl: NetworkData.ApiUrl) async throws -> Data {
        guard let url = apiUrl.url else { throw NetworksError.invalidUrl }
        return try await self.fetchApi(from: url)
    }
    
    //MARK: Private func
    private func fetchApi(from url: URL) async throws -> Data {
        let request = self.makeApiRequest(from: url)
        let (Data, response)  =  try await self.session.data(for: request)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else
        { throw NetworksError.invalidResponse }
        return Data
    }
    
    private func makeApiRequest(from url: URL)-> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(NetworkData.apiToken)", forHTTPHeaderField: "Authorization")
        return request
    }
}
