//
//  AppError.swift
//  flickrAPI-image-search
//
//  Created by Babu Gangatharan on 9/29/19.
//  Copyright © 2019 Babu Gangatharan. All rights reserved.
//

import Foundation

public enum AppError: Error {
    case networkError
    case dataError
}

extension AppError: LocalizedError {
    
    var title: String {
        switch self {
        case .networkError:
            return "No Internet Connection"
        case .dataError:
            return "Server problem"
        }
    }
    
    var message: String {
        return "Please try again later"
    }
}
