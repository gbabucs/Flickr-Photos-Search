//
//  SearchViewController.swift
//  flickrAPI-image-search
//
//  Created by Babu Gangatharan on 9/28/19.
//  Copyright © 2019 Babu Gangatharan. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    //--------------------------------------------------------------------------
    // MARK: - IBOutlets
    //--------------------------------------------------------------------------
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchHistory: UILabel!
    
    //--------------------------------------------------------------------------
    // MARK: - Properties
    //--------------------------------------------------------------------------
    
    let viewModel = SearchViewModel()
    
    //--------------------------------------------------------------------------
    // MARK: - ViewController Lifecycle
    //--------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Flickr Photo Search"
        self.viewModel.getSearchHistory(completion: updateTableView)
    }
    
    //--------------------------------------------------------------------------
    // MARK: - Helpers
    //--------------------------------------------------------------------------
    
    func resetSearchBar() {
        self.searchBar.resignFirstResponder()
        self.searchBar.text = ""
    }
    
    func updateTableView() {
        self.tableView.reloadData()
    }
    
    //--------------------------------------------------------------------------
    // MARK: - Navigation
    //--------------------------------------------------------------------------
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let photoCollectionViewController = segue.destination as? PhotoCollectionViewController
            else { return }
        
        let searchText = sender as? String ?? ""
        let viewModel = PhotoCollectionViewModel(searchText: searchText)
        
        photoCollectionViewController.viewModel = viewModel
    }
}
