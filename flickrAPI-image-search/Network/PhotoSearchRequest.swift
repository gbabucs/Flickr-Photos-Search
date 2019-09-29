//
//  PhotoSearchRequest.swift
//  flickrAPI-image-search
//
//  Created by Babu Gangatharan on 9/28/19.
//  Copyright © 2019 Babu Gangatharan. All rights reserved.
//

import Foundation

class PhotoSearchRequest: NSObject {
    
    //--------------------------------------------------------------------------
    // MARK: - Properties
    //--------------------------------------------------------------------------
    
    let method: String
    
    //--------------------------------------------------------------------------
    // MARK: - Typealias
    //--------------------------------------------------------------------------
    
    typealias PhotosResultHandler = ([Photo]?, [String: Any]?, AppError?) -> ()
    
    override init() {
        self.method = "flickr.photos.search"
    }
    
    //--------------------------------------------------------------------------
    // MARK: - API Request
    //--------------------------------------------------------------------------
    
    /// Get search photos using  `requestPhotos`
    /// the provided `destination` using the `searchText`, `page`, `itemsPerPage`
    ///
    /// - Parameters:
    ///   - searchText:     The `String` value.
    ///   - page:           The `Int` value
    ///   - itemsPerPage:   The `Int` value
    ///   - completion:     The `PhotosResultHandler` value
    
    func requestPhotos(searchText: String, page: Int, itemsPerPage: Int, completion: @escaping PhotosResultHandler) {
        let parameters = "&text=\(searchText)&page=\(page)&per_page=\(itemsPerPage)"
        
        DataAdapter.shared.fetchFlickImage(parameters: parameters, method: method) { response, error in
            
            if let response = response {
                let photos = self.parsePhotos(value: response)
                let metaData = self.parseMetaData(value: response)
                
                completion(photos, metaData, nil)
            }
            
            if let error = error {
                completion(nil, nil, error)
            }
        }
    }
    
    //--------------------------------------------------------------------------
    // MARK: - Helpers
    //--------------------------------------------------------------------------
    
    
    private func parsePhotos(value: FlickrImage) -> [Photo] {
        return value.photos.photo
    }
    
    private func parseMetaData(value: FlickrImage) -> [String: Any] {
        var metaData: [String: Int] = [:]
        
        metaData["currentPage"] = value.photos.page
        metaData["totalPages"] = value.photos.pages
        
        return metaData
    }
    
}
