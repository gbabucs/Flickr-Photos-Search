//
//  NetworkStateTests.swift
//  flickrAPI-image-searchTests
//
//  Created by ThunderFlash on 30/09/2019.
//  Copyright © 2019 Babu Gangatharan. All rights reserved.
//

import XCTest

class NetworkStateTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNetworkStateReachable() {
        let isReachable = NetworkState.isConnected()
        
        if isReachable {
            XCTAssertTrue(isReachable, "Internet Connection Available!")
        } else {
            XCTAssertFalse(isReachable, "Internet Connection not Available!")
        }
    }

}
