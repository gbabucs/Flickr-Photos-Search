//
//  SearchViewController+UISearchBar.swift
//  flickrAPI-image-search
//
//  Created by ThunderFlash on 30/09/2019.
//  Copyright © 2019 Babu Gangatharan. All rights reserved.
//

import UIKit

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
        
        performSegue(withIdentifier: UIStoryboardSegue.identifier, sender: searchText)
        self.resetSearchBar()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.resetSearchBar()
    }
}
