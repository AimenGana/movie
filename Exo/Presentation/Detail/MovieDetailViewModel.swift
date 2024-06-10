//
//  MovieDetailViewModel.swift
//  Exo
//
//  Created by Aimen on 10/06/2024.
//

import Foundation


class MovieDetailViewModel: ObservableObject {
    
    @Published var movieDetail: MovieDetail
    private var useCase: MovieUseCase
    var coordinator: MovieCoordinator
    
    init(movieDetail: MovieDetail,
         useCase: MovieUseCase = MovieUseCase(),
         coordinator: MovieCoordinator
    ){
        self.movieDetail = movieDetail
        self.useCase = useCase
        self.coordinator = coordinator
    }
    
    func getImageUrl(path: String, width: Int? = nil) -> URL? {
        self.useCase.getImageUrl(path: path, width: width)
    }
    
    func dismiss() {
        self.coordinator.dismiss()
    }
}
