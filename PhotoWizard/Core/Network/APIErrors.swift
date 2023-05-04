//
//  APIErrors.swift
//  PhotoWizard
//
//  Created by Дмитрий Фетюхин on 04.05.2023.
//

import Foundation

enum APIErrors: Error {
    
    case urlError
}

extension APIErrors: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .urlError:
            return NSLocalizedString("Error in building url", comment: "")
        }
    }
}
