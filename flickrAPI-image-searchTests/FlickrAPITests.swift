//
//  FlickrAPITests.swift
//  flickrAPI-image-searchTests
//
//  Created by ThunderFlash on 30/09/2019.
//  Copyright © 2019 Babu Gangatharan. All rights reserved.
//

import XCTest
import Alamofire

class FlickrAPITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFlickrAPI_values() {
        let parameter = "paris"
        let method = "flickr.photos.search"
        let baseURL = "https://api.flickr.com/services/rest/"
        let apiKey = "somedifferentKey"
        let httpMethod = HTTPMethod.get
        let formatString = "&format=json&nojsoncallback=1"
        let relativeURL = baseURL + "?method=\(method)\(formatString)\(parameter)&api_key=\(apiKey)"
        
        let userSearch = FlickrAPI.userSearch(query: parameter, method: method)
        
        XCTAssertEqual(userSearch.baseURL, baseURL, "Expected both have same \(baseURL)")
        XCTAssertEqual(userSearch.format, formatString, "Expected both have same \(formatString)")
        XCTAssertEqual(userSearch.httpMethod, httpMethod, "Expected both have same \(httpMethod)")
        XCTAssertNotEqual(userSearch.apiKey, apiKey, "Expected both have different apikeys")
        XCTAssertNotEqual(userSearch.relativeURL, relativeURL, "Expected both have different because apikey is different \(relativeURL)")
        
    }

}
