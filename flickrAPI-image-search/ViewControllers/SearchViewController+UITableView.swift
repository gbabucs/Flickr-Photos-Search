//
//  SearchViewController+UITableView.swift
//  flickrAPI-image-search
//
//  Created by Babu Gangatharan on 9/29/19.
//  Copyright © 2019 Babu Gangatharan. All rights reserved.
//

import UIKit

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
