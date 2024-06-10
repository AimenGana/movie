//
//  MovieCellView.swift
//  Exo
//
//  Created by Aimen on 09/06/2024.
//

import SwiftUI

struct MovieCellView: View {
    var model: MovieDetail
    var getUrl: (String, Int)-> URL?
    var body: some View {
        HStack {
            AsyncImage(url: self.getUrl(model.posterUrl,400)) { phase in
                if let image = phase.image {
                    image
                    .resizable()
                    .scaledToFill()
                } else if phase.error != nil {
                    Image(systemName: "photo.artframe")
                    .resizable()
                    .scaledToFill()
                } else {
                    ProgressView()
                }
            }   .frame(width: 150, height: 200)
                .cornerRadius(10)
            VStack(alignment: .leading) {
                Text(model.title)
                    .font(.system(size: 20 ,weight: .bold , design: .rounded))
                    .padding(.bottom, 20)
                
                HStack {
                    Image(systemName: "star.fill")
                    Text(model.voteAverage)
                        .font(.system(size: 12 ,weight: .bold , design: .rounded))
                    Spacer()
                }
            }
            Spacer()
        }
    }
}

