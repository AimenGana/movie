//
//  MovieListViewModel.swift
//  Exo
//
//  Created by Aimen on 09/06/2024.
//

import Foundation
import SwiftUI

class MovieListViewModel: ObservableObject {
    
    @Published var movieList: [MovieDetail] = []
    @Published var isLoadingPage: Bool = true
    @Published var isErrorPage: Bool = false
    
    private var isFetching: Bool = false
    private var useCase = MovieUseCase()
    
    var coordinator: MovieCoordinator
    
    init(coordinator: MovieCoordinator) {
        self.coordinator = coordinator
    }
    
    func getNextPage() {
        self.isLoadingPage = movieList.isEmpty
        self.isErrorPage = false
        self.isFetching = true
        Task {
            guard let newMovieList = await self.useCase.getNextPage(), !newMovieList.isEmpty
            else {
                DispatchQueue.main.async {
                    if self.movieList.isEmpty {
                        self.isErrorPage = true
                    }
                    self.isLoadingPage = false
                    self.isFetching = false
                }
                return
            }
            DispatchQueue.main.async {
                self.movieList.append(contentsOf: newMovieList)
                self.isLoadingPage = false
                self.isFetching = false
            }
        }
        
    }
    
    func shouldGetNextPage(currentIndex index: Int) {
        if index >= (self.movieList.count-1) - 10, !self.isFetching {
            self.getNextPage()
        }
    }
    
    func getImageUrl(path: String, width: Int) -> URL? {
        self.useCase.getImageUrl(path: path, width: width)
    }
        
    
    func didSelectRowWith(_ row: Int) {
        let model = self.movieList[row]
        self.coordinator.pushView(page: .detail(model: model))
    }
}
