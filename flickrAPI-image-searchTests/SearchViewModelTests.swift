//
//  SearchViewModelTests.swift
//  flickrAPI-image-searchTests
//
//  Created by ThunderFlash on 30/09/2019.
//  Copyright © 2019 Babu Gangatharan. All rights reserved.
//

import XCTest

class SearchViewModelTests: XCTestCase {
    
    var viewModel: SearchViewModel!
    
    override func setUp() {
         viewModel = SearchViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
    }
    
    func testSearchTextInUserDefaults_saving_values() {
        let searchText = "Tiger"
        let differentText = "xyz"
        
        self.viewModel.save(search: searchText) {
            XCTAssertEqual(viewModel.searchHistory.contains(searchText), true, "Expected searchHistroy array contains Tiger")
            XCTAssertEqual(viewModel.searchHistory.contains(differentText), false, "Expected searchHistroy array doesn't contains someValue")
        }
    }
    
    func testGetSearchHistoryInUserDefaults_contains_values() {
        let searchText1 = "Netherlands"
        let searchText2 = "Windmil"
        
        self.viewModel.save(search: searchText1) { }
        self.viewModel.save(search: searchText2) { }
        
        self.viewModel.getSearchHistory {
            XCTAssertEqual(viewModel.searchHistory.contains(searchText1), true, "Expected searchHistroy array contains Netherlands")
            XCTAssertEqual(viewModel.searchHistory.contains(searchText2), true, "Expected searchHistroy array contains Windmil")
        }
    }
    
}
