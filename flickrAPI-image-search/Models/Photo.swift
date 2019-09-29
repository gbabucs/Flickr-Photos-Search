//
//  Photo.swift
//  flickrAPI-image-search
//
//  Created by Babu Gangatharan on 9/28/19.
//  Copyright © 2019 Babu Gangatharan. All rights reserved.
//

import Foundation

struct Photo: Codable {
    let id: String
    let owner: String
    let secret: String
    let server: String
    let farm: Int
    let title: String
    let ispublic: Int
    let isfriend: Int
    let isfamily: Int
}

extension Photo {
    
    var imageURL: String {
        return "https://farm\(farm).static.flickr.com/\(server)/\(id)_\(secret).jpg"
    }
    
}
