//
//  RootCoordinatorView.swift
//  Exo
//
//  Created by Aimen on 09/06/2024.
//

import SwiftUI

struct RootView: View {
    @StateObject var coordinator: MovieCoordinator = MovieCoordinator(path: NavigationPath())
    var body: some View {
        NavigationStack(path: $coordinator.path, root: {
            coordinator.start()                
        })
    }
}

#Preview {
    RootView()
}
