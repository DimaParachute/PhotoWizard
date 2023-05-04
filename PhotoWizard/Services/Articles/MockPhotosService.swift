//
//  MockPhotosService.swift
//  PhotoWizard
//
//  Created by Дмитрий Фетюхин on 04.05.2023.
//

import Foundation
import Combine

final class MockPhotosService: PhotosService {
    
    func fetchPhotos() -> AnyPublisher<PhotosContainer, Error> {
        Just(PhotosContainer(totalResults: 20, photos: Photo.mock))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
