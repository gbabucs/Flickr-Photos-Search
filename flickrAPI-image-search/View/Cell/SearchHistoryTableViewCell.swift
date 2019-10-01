//
//  SearchHistoryTableViewCell.swift
//  flickrAPI-image-search
//
//  Created by Babu Gangatharan on 9/28/19.
//  Copyright © 2019 Babu Gangatharan. All rights reserved.
//

import UIKit

class SearchHistoryTableViewCell: UITableViewCell {
    
    //--------------------------------------------------------------------------
    // MARK: - Properties
    //--------------------------------------------------------------------------
    
    @IBOutlet weak var searchHistory: UILabel!
}

//--------------------------------------------------------------------------
// MARK: - Cell
//--------------------------------------------------------------------------

extension SearchHistoryTableViewCell: Cell {
    
    typealias T = String
    
    func configure(with value: String) {
        self.searchHistory.text = value
    }
}
