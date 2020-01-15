//
//  FlickrAPIService.swift
//  flickrAPI-image-search
//
//  Created by Babu Gangatharan on 9/28/19.
//  Copyright © 2019 Babu Gangatharan. All rights reserved.
//

import Foundation
import Alamofire


class FlickrAPIService {
    
    private let flickrAPI: FlickrAPI
    
    //--------------------------------------------------------------------------
    // MARK: - Typealias
    //--------------------------------------------------------------------------
    
    typealias ResponseHandler = (_ responseData: Data? ,_ error: Error?) -> ()
    
    init(flickrAPI: FlickrAPI) {
        self.flickrAPI = flickrAPI
    }
    
    //--------------------------------------------------------------------------
    // MARK: - API Requests
    //--------------------------------------------------------------------------
    
    /// Get Flicker Image request  using  `getRequest` 
    ///
    /// - Parameters:
    ///   - completion:    The `ResponseHandler` value
    
    func getRequest(completion: @escaping ResponseHandler)  {
        
        let url = flickrAPI.relativeURL
        let httpMethod = flickrAPI.httpMethod
        
        AF.request(url, method: httpMethod).validate().responseJSON { response in
            
            print(response)
            
            switch response.result {
            case .success:
                completion(response.data, nil)
            case .failure(let error):
                print("Failed request with given url: \(url)", error)
                completion(nil, error)
            }
        }
    }
}
