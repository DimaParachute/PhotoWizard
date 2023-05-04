//
//  PhotosContainer.swift
//  PhotoWizard
//
//  Created by Дмитрий Фетюхин on 04.05.2023.
//

import Foundation

struct PhotosContainer: Decodable {
    
    let totalResults: Int
    let photos: [Photo]
}
