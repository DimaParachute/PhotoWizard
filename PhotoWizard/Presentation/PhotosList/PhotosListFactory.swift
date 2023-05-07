//
//  PhotosListFactory.swift
//  PhotoWizard
//
//  Created by Дмитрий Фетюхин on 04.05.2023.
//

import Foundation

protocol PhotosListFactory: AnyObject {
    
    func createPhotosList() -> PhotosListView
}

final class PhotosListFactoryImpl: PhotosListFactory {
    
    func createPhotosList() -> PhotosListView {
        let apiPhotosService = ApiPhotosService()
//        let mockPhotosService = MockPhotosService()
        let stateMachine = StateMachine(state: .start)
        let viewModel = PhotosListViewModel(apiPhotosService, stateMachine)
        return PhotosListView(viewModel: viewModel)
    }
}
