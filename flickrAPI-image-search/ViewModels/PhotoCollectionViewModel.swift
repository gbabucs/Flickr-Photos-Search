//
//  PhotoCollectionViewModel.swift
//  flickrAPI-image-search
//
//  Created by Babu Gangatharan on 9/28/19.
//  Copyright © 2019 Babu Gangatharan. All rights reserved.
//

import Foundation

class PhotoCollectionViewModel {
    
    //--------------------------------------------------------------------------
    // MARK: - Static Properties
    //--------------------------------------------------------------------------
    
    let itemsPerPage = 30
    let itemsPerRow = 2
    let itemsLimit = 15
    let itemsPerSection = 20
    
    //--------------------------------------------------------------------------
    // MARK: - Properties
    //--------------------------------------------------------------------------
    
    let searchText: String
    let photoSearchRequest: PhotoSearchRequest
    let navigationTitle: String
    
    var photos: [Photo] = []
    var currentPage = 0
    var totalPages = 0
    
    //--------------------------------------------------------------------------
    // MARK: - Lifecycle
    //--------------------------------------------------------------------------
    
    init(searchText: String) {
        self.navigationTitle = searchText
        self.searchText = searchText
        self.photoSearchRequest = PhotoSearchRequest()
    }
    
    //--------------------------------------------------------------------------
    // MARK: - Data Interaction
    //--------------------------------------------------------------------------
    
    func requestPhotos(completion: @escaping (_ error: AppError?) -> ()) {
        self.currentPage += 1
        
        self.photoSearchRequest.requestPhotos(searchText: searchText, page: currentPage, itemsPerPage: itemsPerPage) { photos, metaData, error in
            
            guard let photos = photos,
                let currentPage = metaData?["currentPage"] as? Int,
                let totalPages = metaData?["totalPages"] as? Int
                else { return completion(error) }
            
            self.photos.append(contentsOf: photos)
            
            self.currentPage = currentPage
            self.totalPages = totalPages
            
            completion(nil)
        }
    }
}
