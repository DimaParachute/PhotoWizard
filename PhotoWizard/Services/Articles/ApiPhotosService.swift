//
//  ApiPhotosService.swift
//  PhotoWizard
//
//  Created by Дмитрий Фетюхин on 04.05.2023.
//

import Foundation
import Combine

final class ApiPhotosService: PhotosService {
    
    func fetchPhotos(page: Int) -> AnyPublisher<[Photo], Error> {
        PhotosRequest.photos(page: page)
    }
}
