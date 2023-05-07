//
//  ContentView.swift
//  PhotoWizard
//
//  Created by Дмитрий Фетюхин on 04.05.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct PhotosListView: View {
    
    @ObservedObject var viewModel: PhotosListViewModel
    
    var body: some View {
        contentView()
            .onAppear {
                viewModel.startFetchingPhotos()
            }
            .navigationTitle("Photos")
    }
    
    @ViewBuilder func contentView() -> some View {
        switch viewModel.state {
        case .start:
            ProgressView()
            
        case .loading:
            ProgressView()
            
        case .results:
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                    ForEach(viewModel.photos, id: \.self) { photo in
                        if photo == viewModel.photos.last {
                            AnimatedImage(url: URL(string: photo.urls.regular))
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(12)
                                .padding(16)
                                .shadow(radius: 10)
                                .onAppear(perform: viewModel.startFetchingPhotos)
                        } else {
                            AnimatedImage(url: URL(string: photo.urls.regular))
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(12)
                                .padding(16)
                                .shadow(radius: 10)
                        }
                    }
                }
                ProgressView()
            }
            
        case .error:
            ProgressView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosListView(viewModel: PhotosListViewModel(MockPhotosService(), StateMachine(state: .start)))
    }
}
