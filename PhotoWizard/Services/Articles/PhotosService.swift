//
//  PhotosService.swift
//  PhotoWizard
//
//  Created by Дмитрий Фетюхин on 04.05.2023.
//

import Combine

protocol PhotosService: AnyObject {
    
    func fetchPhotos(page: Int) -> AnyPublisher<[Photo], Error>
}
