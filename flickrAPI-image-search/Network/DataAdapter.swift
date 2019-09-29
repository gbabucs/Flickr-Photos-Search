//
//  DataController.swift
//  flickrAPI-image-search
//
//  Created by Babu Gangatharan on 9/28/19.
//  Copyright © 2019 Babu Gangatharan. All rights reserved.
//

import Foundation


class DataAdapter {
    
    static let shared = DataAdapter()
    
    //--------------------------------------------------------------------------
    // MARK: - Typealias
    //--------------------------------------------------------------------------
    
    typealias GetCompletionHandler = (FlickrImage?, AppError?) -> ()
    
    //--------------------------------------------------------------------------
    // MARK: - Functions
    //--------------------------------------------------------------------------
    
    /// Get Flicker Image response using  `fetchFlickImage`  to
    /// the provided `destination` using the `method`, `parameters`
    ///
    /// - Parameters:
    ///   - parameters:    The `String` value.
    ///   - method:        The `String` value
    ///   - completion:    The `GetCompletionHandler` value
    
    func fetchFlickImage(parameters: String, method: String, completion: @escaping GetCompletionHandler) {
        let service = FlickrAPIService(flickrAPI: .userSearch(query: parameters, method: method))
        
        self.fetchData(from: service, type: FlickrImage.self, completion: completion)
    }

    
    //--------------------------------------------------------------------------
    // MARK: - Private functions
    //--------------------------------------------------------------------------
    
    private func fetchData<T: Codable>(from request: FlickrAPIService, type: T.Type , completion: @escaping (_ response: T?, _ error: AppError?) -> Void) {
        request.getRequest { response, error in
            var appError: AppError?
            let result = self.processData(type: type, response: response)
            
            if let _ = error {
               appError = AppError.dataError
            }
            
            completion(result, appError)
        }
    }
    
    private func processData<T: Codable>(type: T.Type, response: Data?) -> T? {
        var result: T? = nil
        
        if let jsondata = response {
            do {
                let object = try JSONDecoder().decode(T.self, from: jsondata)
                
                result = object
                
            } catch let jsonError {
                print("Error decoding Json Questons", jsonError)
            }
        }
        
        return result
    }
}
