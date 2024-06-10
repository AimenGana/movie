//
//  ContentView.swift
//  Exo
//
//  Created by Aimen on 09/06/2024.
//

import SwiftUI

struct MovieListView: View {
    @StateObject var viewModel: MovieListViewModel
    @State var firstCall = true
    
    var body: some View {
        List {
            ForEach(0..<$viewModel.movieList.count, id: \.self) { index in
                MovieCellView(model: self.viewModel.movieList[index],
                              getUrl: self.viewModel.getImageUrl)
                .cornerRadius(10)
                .onTapGesture {
                    self.viewModel.didSelectRowWith(index)
                }
                .listRowSeparator(.hidden)
                .onAppear {
                    self.viewModel.shouldGetNextPage(currentIndex: index)
                }
                
            }
        }
        .listStyle(.plain)
        .onAppear {
            if firstCall {
                self.viewModel.getNextPage()
                firstCall = false
            }
            
        }
        .navigationTitle("List")
    }
}
