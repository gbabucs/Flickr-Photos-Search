//
//  PhotoSearchRequestTests.swift
//  flickrAPI-image-searchTests
//
//  Created by ThunderFlash on 30/09/2019.
//  Copyright © 2019 Babu Gangatharan. All rights reserved.
//

import XCTest

class PhotoSearchRequestTests: XCTestCase {
    
    var photoSearchRequest: PhotoSearchRequest!

    override func setUp() {
        self.photoSearchRequest = PhotoSearchRequest()
    }

    override func tearDown() {
        self.photoSearchRequest = nil
    }
    
    func test_Parse_Photo_have_original_model_values() {
        let photos = self.photoSearchRequest.parsePhotos(with: imageResultModel)
        
        XCTAssertEqual(photos.count, imageResultModel.photos.photo.count, "Expected both should have same count")
        XCTAssertEqual(photos.first?.imageURL, imageResultModel.photos.photo.first?.imageURL, "Expected both should have same imageURL: \(String(describing: photos.first?.imageURL))")
        XCTAssertEqual(photos.first?.id, imageResultModel.photos.photo.first?.id, "Expected both should have same id: \(String(describing: photos.first?.id))")
    }
    
    func test_Parse_MetaDataContains_CurrentPage_and_totalPages() {
        let metaData = self.photoSearchRequest.parseMetaData(with: imageResultModel)
        let currentPage = metaData["currentPage"] as? Int
        let totalPages = metaData["totalPages"] as? Int
        
        XCTAssertEqual(currentPage, imageResultModel.photos.page, "Expected both should have same page count")
        XCTAssertEqual(totalPages, imageResultModel.photos.pages, "Expected both should have same pages count")
    }

}

//    "photo": [
//    {
//      "id": "48820212372",
//      "owner": "135162570@N03",
//      "secret": "2bbb5d92b0",
//      "server": "65535",
//      "farm": 66,
//      "title": "Casper 7 month make fluffy cat",
//      "ispublic": 1,
//      "isfriend": 0,
//      "isfamily": 0
//    }]
    
//    "photos": {
//    "page": 1,
//    "pages": 1707,
//    "perpage": 100,
//    "total": "170636",
    
private let photoModel = PhotoModel(id: "1", owner: "135162570", secret: "2bbb5d92b0", server: "65535", farm: 66, title: "Casper", ispublic: 1, isfriend: 0, isfamily: 0)
private let photosModel = PhotosModel(page: 1, pages: 1707, perpage: 100, total: "170636", photo: [photoModel])
private let imageResultModel = FlickrImageResultModel(photos: photosModel, stat: "ok")
