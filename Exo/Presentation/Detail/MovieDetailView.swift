//
//  MovieDetailView.swift
//  Exo
//
//  Created by Aimen on 09/06/2024.
//

import SwiftUI

struct MovieDetailView: View {
    @StateObject var viewModel: MovieDetailViewModel
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ZStack {
                    MovieHeaderView(viewModel: viewModel)
                    VStack {
                        HStack {
                            Group {
                                Image(systemName: "chevron.left")
                                    .padding(.trailing, 20)
                                    .font(.system(size: 20 ,weight: .semibold , design: .rounded))
                            }.onTapGesture {
                                self.viewModel.dismiss()
                            }
                            Spacer()
                        }
                        .padding(.top, 60)
                        .padding(.leading, 20)
                        Spacer()
                    }
                
                }
                
                Spacer()
                
                Text("Overview")
                    .font(.system(size: 30 ,weight: .bold , design: .rounded))
                    .padding(.horizontal)
                
                Text(viewModel.movieDetail.overview)
                    .font(.system(size: 13 ,weight: .semibold , design: .rounded))
                    .padding(.horizontal)
            }
            .background {
                Color(.background)
            }
        }
        .navigationBarBackButtonHidden(false)
        .ignoresSafeArea(edges: .top)
    }
}

