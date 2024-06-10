//
//  MovieCoordinator.swift
//  Exo
//
//  Created by Aimen on 09/06/2024.
//

import SwiftUI


class MovieCoordinator: ObservableObject {
    enum Page: Hashable {
        case detail(model: MovieDetail)
    }
   
    @Published var path: NavigationPath
    
    init(path: NavigationPath) {
        self.path = path
    }
    
    func pushView(page: MovieCoordinator.Page) {
        switch page {
        case .detail:
            path.append(page)
        }
    }
    
    func dismiss() {
        self.path.removeLast()
    }
    
    @ViewBuilder
    func build(page: MovieCoordinator.Page) -> some View {
        switch page {
        case .detail(let model):
            let viewModel = MovieDetailViewModel(movieDetail: model, coordinator: self)
            MovieDetailView(viewModel: viewModel)
        }
    }
    
    @ViewBuilder
    func start() -> some View {
        let viewModel = MovieListViewModel(coordinator: self)
        MovieListView(viewModel: viewModel)
            .navigationDestination(for: MovieCoordinator.Page.self, destination: { page in
                self.build(page: page)
            })
    }
}
