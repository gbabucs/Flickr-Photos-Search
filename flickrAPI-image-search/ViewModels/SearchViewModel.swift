//
//  SearchViewModel.swift
//  flickrAPI-image-search
//
//  Created by Babu Gangatharan on 9/28/19.
//  Copyright © 2019 Babu Gangatharan. All rights reserved.
//

import Foundation

class SearchViewModel {
    
    typealias completionHandler = () -> ()
    
    //--------------------------------------------------------------------------
    // MARK: - Properties
    //--------------------------------------------------------------------------
    
    static let reuseIdentifier = "SearchViewCell"
    
    let defaults = UserDefaults.standard
    
    struct Key {
        static let search = "SearchHistoryKey"
    }
    
    var searchHistory: [String] = []
    
    init(history: [String] = []) {
        self.searchHistory = history
    }
    
    //--------------------------------------------------------------------------
    // MARK: - Functions
    //--------------------------------------------------------------------------
    
    func getSearchHistory(completion: completionHandler) {
        guard let result = defaults.object(forKey: Key.search),
            let data = result as? [String] else { return }
        
        self.searchHistory = data
        
        completion()
    }

    func save(search text: String, with completion: completionHandler) {
        let uniqueSearch = searchHistory.filter { $0.lowercased() != text.lowercased() }
        
        self.searchHistory = uniqueSearch
        self.searchHistory.insert(text, at: 0)
        
        self.defaults.set(searchHistory, forKey: Key.search)
        self.defaults.synchronize()
        
        completion()
    }
    
}

