//
//  PhotosModel.swift
//  flickrAPI-image-search
//
//  Created by Babu Gangatharan on 9/28/19.
//  Copyright © 2019 Babu Gangatharan. All rights reserved.
//

import Foundation

// MARK: - Photos

struct PhotosModel: Codable {
    let page: Int
    let pages: Int
    let perpage: Int
    let total: String
    let photo: [PhotoModel]
}
