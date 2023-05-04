//
//  PhotoMock.swift
//  PhotoWizard
//
//  Created by Дмитрий Фетюхин on 04.05.2023.
//

import Foundation

// MARK: - Mock data

extension Photo {
    
    static let mock = loadPhotos()
}

private struct PhotosMock: Decodable {
    
    let photos: [Photo]
}

private func loadPhotos() -> [Photo] {
    guard let url = Bundle.main.url(forResource: "PhotosMock", withExtension: "json"),
          let data = try? Data(contentsOf: url) else { return [] }
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    let jsonMock = try? decoder.decode(PhotosMock.self, from: data)
    return jsonMock?.photos ?? []
}
