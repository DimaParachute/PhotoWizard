//
//  Photo.swift
//  PhotoWizard
//
//  Created by Дмитрий Фетюхин on 04.05.2023.
//

import Foundation

struct Photo: Decodable, Hashable {
    
    let urls: Urls
}

struct Urls: Decodable, Hashable {
    
    let regular: String
    let thumb: String
}
