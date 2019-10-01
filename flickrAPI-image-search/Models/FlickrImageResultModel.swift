//
//  FlickrImageResultModel.swift
//  flickrAPI-image-search
//
//  Created by Babu Gangatharan on 9/28/19.
//  Copyright © 2019 Babu Gangatharan. All rights reserved.
//

import Foundation

// MARK: - FlickrImage

struct FlickrImageResultModel: Codable {
    let photos: PhotosModel
    let stat: String
}
