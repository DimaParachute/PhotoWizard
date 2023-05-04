//
//  PhotosRequest.swift
//  PhotoWizard
//
//  Created by Дмитрий Фетюхин on 04.05.2023.
//

import Foundation
import Combine

enum PhotosRequest {
    
    static let agent = Agent()
    static let base = "api.unsplash.com"
}

extension PhotosRequest {
    
    static func photos() -> AnyPublisher<PhotosContainer, Error> {
        var components = URLComponents()
        components.scheme = "https"
        components.host = base
        components.path = "/photos"
        components.queryItems = [
            URLQueryItem(name: "client_id", value: APIConstants.apiKey),
            URLQueryItem(name: "page", value: "1")
        ]
        guard let url = components.url else {
            return Fail(error: APIErrors.urlError)
                .eraseToAnyPublisher()
        }
        let request = URLRequest(url: url)
        return run(request)
    }
    
    static func run<T: Decodable>(_ request: URLRequest) -> AnyPublisher<T, Error> {
        agent.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
