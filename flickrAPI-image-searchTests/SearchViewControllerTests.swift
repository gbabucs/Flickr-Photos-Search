//
//  SearchViewControllerTests.swift
//  flickrAPI-image-searchTests
//
//  Created by ThunderFlash on 30/09/2019.
//  Copyright © 2019 Babu Gangatharan. All rights reserved.
//

import XCTest
@testable import flickrAPI_image_search

class SearchViewControllerTests: XCTestCase {

    var sut: SearchViewController!
    
    override func setUp() {
        
        super.setUp()
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = storyboard.instantiateInitialViewController() as? UINavigationController
        
        sut = navigationController?.topViewController as? SearchViewController
        
        _ = sut.view
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_sut_Can_Instantiate_SearchViewController() {
        XCTAssertNotNil(sut)
    }
    
    func test_sut_TableView_Is_NotNil_After_ViewDidLoad() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func test_sut_Has_Values_For_TableView() {
        XCTAssertNotNil(sut.viewModel.searchHistory)
    }
    
    func test_sut_ShouldSet_TableViewDataSource() {
        XCTAssertNotNil(sut.tableView.dataSource)
    }
    
    func test_TableView_Has_Delegate() {
        XCTAssertNotNil(sut.tableView.delegate)
    }
    
    func test_TableView_Confroms_TableViewDelegateProtocol() {
        XCTAssertTrue(sut.conforms(to: UITableViewDelegate.self))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:didSelectRowAt:))))
    }
    
    func test_sut_TableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(sut.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:cellForRowAt:))))
    }
    
    // MARK: - Storyboard Segues

    // utility for finding segues
    func hasSegueWithIdentifier(id: String) -> Bool {
    
        let segues = sut.value(forKey: "storyboardSegueTemplates") as? [NSObject]
        let filtered = segues?.filter({ $0.value(forKey: "identifier") as? String == id })
        
        return (filtered?.count ?? 0) > 0
    }
    
    func test_sut_HasSegue_Name_showPhotoCollectionViewController() {

        let targetIdentifier = UIStoryboardSegue.identifier
        XCTAssertTrue(hasSegueWithIdentifier(id: targetIdentifier))
    }
        
}
