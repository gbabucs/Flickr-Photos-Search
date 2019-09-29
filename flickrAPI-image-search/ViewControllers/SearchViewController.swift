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
    
    private let viewModel = SearchViewModel()
    
    //--------------------------------------------------------------------------
    // MARK: - ViewController Lifecycle
    //--------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.getSearchHistory(completion: updateTableView)
    }
    
    //--------------------------------------------------------------------------
    // MARK: - Helpers
    //--------------------------------------------------------------------------
    
    private func resetSearchBar() {
        self.searchBar.resignFirstResponder()
        self.searchBar.text = nil
    }
    
    private func updateTableView() {
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

//--------------------------------------------------------------------------
// MARK: - UISearchBarDelegate
//--------------------------------------------------------------------------

extension SearchViewController: UISearchBarDelegate {
    
    //--------------------------------------------------------------------------
    // MARK: - User Interaction
    //--------------------------------------------------------------------------
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        
        self.viewModel.save(search: searchText, with: updateTableView)
        
        performSegue(withIdentifier: "showPhotoCollectionViewController", sender: searchText)
        self.resetSearchBar()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.resetSearchBar()
    }
}

//--------------------------------------------------------------------------
// MARK: - UITableViewDelegate
//--------------------------------------------------------------------------

extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showPhotoCollectionViewController", sender: self.viewModel.searchHistory[indexPath.row])
    }
    
}

//--------------------------------------------------------------------------
// MARK: - UITableViewDataSource
//--------------------------------------------------------------------------

extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.searchHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchHistoryTableViewCell.reuseIdentifier) as? SearchHistoryTableViewCell
            else { return UITableViewCell() }
        
        let searchText = self.viewModel.searchHistory[indexPath.row]
        
        cell.configure(with: searchText)
        
        return cell
    }
    
}
