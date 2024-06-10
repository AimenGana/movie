//
//  MovieHeaderView.swift
//  Exo
//
//  Created by Aimen on 10/06/2024.
//

import SwiftUI

struct MovieHeaderView: View {
    @ObservedObject var viewModel: MovieDetailViewModel
    var body: some View {
        ZStack {
            VStack {
                AsyncImage(url: viewModel.getImageUrl(
                    path: viewModel.movieDetail.posterUrl
                )) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .blur(radius: 8)
                    } else if phase.error != nil {
                        Image(systemName: "photo.artframe")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .blur(radius: 8)
                    } else {
                        ProgressView()
                    }
                }
                .frame(height: 380)
                Spacer()
            }

            VStack {
                Spacer()
                AsyncImage(url: viewModel.getImageUrl(
                    path: viewModel.movieDetail.posterUrl,
                    width: 200
                )) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFill()
                    } else if phase.error != nil {
                        Image(systemName: "photo.artframe")
                            .resizable()
                            .scaledToFill()
                            .background {
                                Color.secondary
                            }
                    } else {
                        ProgressView()
                    }
                }
                .frame(width: 150, height: 200)
                .cornerRadius(10)
                .padding(.bottom)
                
                ZStack {
                    Rectangle().fill (
                        LinearGradient(
                            colors: [Color(.background).opacity(0),
                                     Color(.background)],
                            startPoint: .top,
                            endPoint: .bottom)
                    ).frame(height: 100)
                    
                    Text(viewModel.movieDetail.title)
                        .font(.system(size: 30 ,weight: .bold , design: .rounded))
                        .lineLimit(2)
                        .foregroundStyle(Color(.text))
                        .padding(.horizontal)
                }
                
            }
        }
        .frame(width: UIScreen.main.bounds.width ,height: 400)
        .clipped()
    }
}
